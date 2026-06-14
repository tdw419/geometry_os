; Memory Palace Autonomous Renderer
; Polls facts.json and renders spatially
; Lives INSIDE the palace, not external

; Constants
FACTS_FILE_PTR:   .dw 0x2000      ; RAM location where facts will be loaded
POLL_DELAY:       .dw 1000        ; Poll every 1000 frames

; Registers we'll use
; r0: fact count
; r1: current fact index
; r2: ring number (0=critical, 1=important, 2=reference)
; r3: angle position
; r4: color based on tier
; r5: screen center X
; r6: screen center Y
; r7: ring radius

; Entry point
start:
    ; Initialize
    CALL clear_screen
    LOAD r5, 128           ; Center X
    LOAD r6, 128           ; Center Y

poll_loop:
    ; Read facts count from RAM (for now, hardcoded fact count)
    ; In full version: would parse facts.json from memory
    LOAD r0, 2             ; fact count

    ; Render title
    LOAD r2, 10
    LOAD r3, 20
    LOAD r4, 0xFFFFFF      ; White
    CALL draw_text_palace

    ; Render each fact
    LOAD r1, 0             ; fact index = 0

render_facts_loop:
    ; Check if done
    CMP r1, r0
    JGE poll_done

    ; Calculate position
    ; Ring = fact_index % 3
    MOD r2, r1, 3          ; r2 = ring

    ; Angle = fact_index * 30
    MUL r3, r1, 30

    ; Radius = 40 + (ring * 25)
    MUL r7, r2, 25
    ADD r7, r7, 40

    ; Color by tier
    CMP r2, 0              ; Critical?
    JEQ draw_critical
    CMP r2, 1              ; Important?
    JEQ draw_important
    LOAD r4, 0x4444FF      ; Reference = Blue
    JMP draw_item

draw_critical:
    LOAD r4, 0xFF4444      ; Critical = Red
    JMP draw_item

draw_important:
    LOAD r4, 0xFFFF44      ; Important = Yellow
    JMP draw_item

draw_item:
    ; Draw dot at calculated position
    CALL draw_ring_dot

    ; Next fact
    ADD r1, r1, 1
    JMP render_facts_loop

poll_done:
    ; Show "polling..." indicator
    LOAD r2, 240
    LOAD r3, 10
    LOAD r4, 0x888888      ; Gray
    CALL draw_text_polling

    ; Wait
    LOAD r10, POLL_DELAY
    CALL delay

    ; Loop forever
    JMP poll_loop

; Subroutine: clear screen
clear_screen:
    RECTF 0, 0, 256, 256, 0x000000
    RET

; Subroutine: draw text "Memory Palace"
draw_text_palace:
    ; r2=Y, r3=X, r4=color
    ; Simplified: draw a few pixels as placeholder
    ; Real implementation would need font rendering
    PIXEL r3, r2, r4
    PIXEL r3+1, r2+1, r4
    PIXEL r3+2, r2+2, r4
    RET

; Subroutine: draw text "polling..."
draw_text_polling:
    ; r2=Y, r3=X, r4=color
    PIXEL r3, r2, r4
    PIXEL r3+1, r2, r4
    PIXEL r3+2, r2, r4
    RET

; Subroutine: draw a dot on a ring
; r2=ring, r3=angle, r4=color, r5=centerX, r6=centerY, r7=radius
draw_ring_dot:
    ; Convert angle to radians (simplified)
    ; x = center + radius * cos(angle)
    ; y = center + radius * sin(angle)
    ; For now, approximate with fixed positions

    ; Calculate X
    CMP r3, 0
    JEQ angle_0
    CMP r3, 30
    JEQ angle_30
    CMP r3, 60
    JEQ angle_60
    CMP r3, 90
    JEQ angle_90
    CMP r3, 120
    JEQ angle_120
    CMP r3, 150
    JEQ angle_150
    CMP r3, 180
    JEQ angle_180
    JMP angle_default

angle_0:
    LOAD r8, r7             ; Full X offset
    LOAD r9, 0              ; No Y offset
    JMP draw_dot

angle_30:
    LOAD r8, r7
    SHR r8, 1               ; Half X
    LOAD r9, r7
    SHR r9, 2               ; Quarter Y
    JMP draw_dot

angle_60:
    LOAD r8, r7
    SHR r8, 2               ; Quarter X
    LOAD r9, r7
    SHR r9, 1               ; Half Y
    JMP draw_dot

angle_90:
    LOAD r8, 0              ; No X offset
    LOAD r9, r7             ; Full Y offset
    JMP draw_dot

angle_120:
    LOAD r8, r7
    SHR r8, 2               ; Quarter X (negative direction - simplified)
    LOAD r9, r7
    SHR r9, 1               ; Half Y
    JMP draw_dot

angle_150:
    LOAD r8, r7
    SHR r8, 1               ; Half X (negative)
    LOAD r9, r7
    SHR r9, 2               ; Quarter Y
    JMP draw_dot

angle_180:
    LOAD r8, r7             ; Full X (negative - simplified)
    LOAD r9, 0              ; No Y offset
    JMP draw_dot

angle_default:
    LOAD r8, 10
    LOAD r9, 10

draw_dot:
    ; r8=x_offset, r9=y_offset
    ADD r8, r8, r5          ; X = center + offset
    ADD r9, r9, r6          ; Y = center + offset

    ; Draw 3x3 dot
    PIXEL r8, r9, r4
    PIXEL r8+1, r9, r4
    PIXEL r8-1, r9, r4
    PIXEL r8, r9+1, r4
    PIXEL r8, r9-1, r4
    PIXEL r8+1, r9+1, r4
    PIXEL r8-1, r9-1, r4

    RET

; Subroutine: delay
; r10 = delay count
delay:
    SUB r10, r10, 1
    JNZ delay
    RET

; End
HALT
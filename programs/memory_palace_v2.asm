; Memory Palace Autonomous Renderer v2
; Reads binary facts file from RAM and renders
; Runs forever, polling for changes

; RAM Layout
; 0x2000: Binary facts data
;   +0: magic (0xDEADBEEF)
;   +4: version
;   +8: fact_count
;   +12: first_fact (tier, angle, ring) - each 12 bytes

; Registers
; r0: base address (0x2000)
; r1: fact_count
; r2: current_fact_index
; r3: fact_address (pointer to current fact)
; r4: tier
; r5: angle
; r6: ring
; r7: screen_center_x
; r8: screen_center_y
; r9: radius
; r10: color
; r11: x_offset
; r12: y_offset
; r13: screen_x
; r14: screen_y
; r15: loop_counter

; Constants
BASE_ADDR:    .dw 0x2000
POLL_DELAY:   .dw 500      ; Poll every 500 frames

; Entry point
start:
    LOAD r0, BASE_ADDR
    LOAD r7, 128           ; Center X
    LOAD r8, 128           ; Center Y

main_loop:
    ; Clear screen
    CALL clear_screen

    ; Draw title
    LOAD r10, 0xFFFFFF
    CALL draw_title

    ; Read fact count from offset +8
    ADD r15, r0, 8         ; r15 = &fact_count
    PEEK r1, r15           ; r1 = fact_count

    ; If no facts, show empty message
    CMP r1, 0
    JGT render_facts
    CALL draw_empty
    JMP wait_and_loop

render_facts:
    LOAD r2, 0             ; fact_index = 0

fact_loop:
    ; Check if done
    CMP r2, r1
    JGE wait_and_loop

    ; Calculate fact address: 0x2000 + 12 + (index * 12)
    LOAD r15, 12
    MUL r15, r15, r2       ; offset = 12 * index
    ADD r15, r15, 12       ; +12 (skip header)
    ADD r3, r0, r15        ; r3 = &fact

    ; Read tier (first 4 bytes)
    PEEK r4, r3            ; r4 = tier

    ; Read angle (next 4 bytes)
    ADD r15, r3, 4
    PEEK r5, r15           ; r5 = angle

    ; Read ring (next 4 bytes)
    ADD r15, r3, 8
    PEEK r6, r15           ; r6 = ring

    ; Calculate color and radius based on tier/ring
    CALL calculate_color
    CALL calculate_radius

    ; Draw the fact
    CALL draw_fact_dot

    ; Next fact
    ADD r2, r2, 1
    JMP fact_loop

wait_and_loop:
    ; Show "polling" indicator
    CALL draw_polling_indicator

    ; Wait
    LOAD r15, POLL_DELAY
    CALL delay

    ; Loop forever
    JMP main_loop

; Subroutine: clear screen
clear_screen:
    RECTF 0, 0, 256, 256, 0x000011  ; Dark blue background
    RET

; Subroutine: draw title
draw_title:
    ; Simple pixel-based title
    PIXEL r7-50, r8-100, r10
    PIXEL r7-49, r8-100, r10
    PIXEL r7-48, r8-100, r10
    PIXEL r7-47, r8-100, r10
    PIXEL r7-46, r8-100, r10
    ; M
    PIXEL r7-44, r8-100, r10
    PIXEL r7-43, r8-99, r10
    PIXEL r7-42, r8-98, r10
    PIXEL r7-41, r8-99, r10
    PIXEL r7-40, r8-100, r10
    ; Continue simplified...
    RET

; Subroutine: calculate color based on tier
calculate_color:
    CMP r4, 0              ; Critical?
    JEQ color_critical
    CMP r4, 1              ; Important?
    JEQ color_important
    LOAD r10, 0x4444FF     ; Reference = Blue
    RET

color_critical:
    LOAD r10, 0xFF4444     ; Critical = Red
    RET

color_important:
    LOAD r10, 0xFFFF44     ; Important = Yellow
    RET

; Subroutine: calculate radius based on ring
calculate_radius:
    ; radius = 40 + (ring * 30)
    LOAD r15, 30
    MUL r9, r6, r15        ; r9 = ring * 30
    ADD r9, r9, 40         ; r9 = 40 + offset
    RET

; Subroutine: draw a fact dot
draw_fact_dot:
    ; Calculate position based on angle
    ; Simplified: use angle as index into position table
    CALL calculate_position

    ; Draw dot at screen coordinates
    PIXEL r13, r14, r10
    PIXEL r13+1, r14, r10
    PIXEL r13-1, r14, r10
    PIXEL r13, r14+1, r10
    PIXEL r13, r14-1, r10
    PIXEL r13+1, r14+1, r10
    PIXEL r13-1, r14-1, r10
    PIXEL r13+1, r14-1, r10
    PIXEL r13-1, r14+1, r10

    ; Draw ring circle (simplified - just a few points)
    CALL draw_ring_circle

    RET

; Subroutine: calculate x,y from angle and radius
calculate_position:
    ; Use angle to determine position on ring
    ; Angle values: 0=right, 90=bottom, 180=left, 270=top
    ; We'll simplify: angle % 12 gives hour position

    LOAD r15, 12
    MOD r15, r5, r15       ; r15 = angle % 12

    CMP r15, 0
    JEQ pos_0
    CMP r15, 1
    JEQ pos_1
    CMP r15, 2
    JEQ pos_2
    CMP r15, 3
    JEQ pos_3
    CMP r15, 4
    JEQ pos_4
    CMP r15, 5
    JEQ pos_5
    CMP r15, 6
    JEQ pos_6
    CMP r15, 7
    JEQ pos_7
    CMP r15, 8
    JEQ pos_8
    CMP r15, 9
    JEQ pos_9
    CMP r15, 10
    JEQ pos_10
    JMP pos_11

; Position calculations (simplified cos/sin approximations)
pos_0:   LOAD r11, r9    LOAD r12, 0      JMP calc_done
pos_1:   LOAD r11, r9    SHR r11, 1      LOAD r12, r9    SHR r12, 2    JMP calc_done
pos_2:   LOAD r11, r9    SHR r11, 2      LOAD r12, r9    SHR r12, 1    JMP calc_done
pos_3:   LOAD r11, 0     LOAD r12, r9    JMP calc_done
pos_4:   LOAD r11, r9    SHR r11, 2      LOAD r12, r9    SHR r12, 1    LOAD r15, 0xFFFFFFF0  ADD r12, r12, r15  JMP calc_done
pos_5:   LOAD r11, r9    SHR r11, 2      LOAD r12, r9    SHR r12, 2    LOAD r15, 0xFFFFFFF0  ADD r12, r12, r15  JMP calc_done
pos_6:   LOAD r11, r9    LOAD r15, 0xFFFFFF00  ADD r11, r11, r15  LOAD r12, 0      JMP calc_done
pos_7:   LOAD r11, r9    SHR r11, 2      LOAD r15, 0xFFFFFF00  ADD r11, r11, r15  LOAD r12, r9    SHR r12, 2    LOAD r15, 0xFFFFFFF0  ADD r12, r12, r15  JMP calc_done
pos_8:   LOAD r11, r9    SHR r11, 2      LOAD r15, 0xFFFFFF00  ADD r11, r11, r15  LOAD r12, r9    SHR r12, 1    LOAD r15, 0xFFFFFF00  ADD r12, r12, r15  JMP calc_done
pos_9:   LOAD r11, 0     LOAD r12, r9    LOAD r15, 0xFFFFFF00  ADD r12, r12, r15  JMP calc_done
pos_10:  LOAD r11, r9    SHR r11, 2      LOAD r12, r9    SHR r12, 1    JMP calc_done
pos_11:  LOAD r11, r9    SHR r11, 1      LOAD r12, r9    SHR r12, 2    JMP calc_done

calc_done:
    ; r11 = x_offset, r12 = y_offset
    ADD r13, r7, r11      ; screen_x = center + offset_x
    ADD r14, r8, r12      ; screen_y = center + offset_y

    ; Clamp to screen
    CMP r13, 5
    JGE clamp_x_ok
    LOAD r13, 5
    JMP clamp_y
clamp_x_ok:
    CMP r13, 251
    JLE clamp_y
    LOAD r13, 251
clamp_y:
    CMP r14, 5
    JGE clamp_y_ok
    LOAD r14, 5
    JMP draw_ring
clamp_y_ok:
    CMP r14, 251
    JLE draw_ring
    LOAD r14, 251

draw_ring:
    RET

; Subroutine: draw ring circle (simplified - draw a few points)
draw_ring_circle:
    ; Draw 12 points around the ring
    LOAD r15, 0

ring_point_loop:
    CMP r15, 12
    JGE ring_done

    ; Calculate position for this ring point
    PUSH r2               ; Save fact index
    PUSH r4               ; Save tier
    PUSH r5               ; Save angle
    PUSH r6               ; Save ring

    LOAD r5, r15          ; Use ring point index as angle
    CALL calculate_position

    POP r6                ; Restore ring
    POP r5                ; Restore angle
    POP r4                ; Restore tier
    POP r2                ; Restore fact index

    ; Draw ring point (dim color)
    LOAD r10, 0x333333
    PIXEL r13, r14, r10

    ADD r15, r15, 1
    JMP ring_point_loop

ring_done:
    RET

; Subroutine: draw empty message
draw_empty:
    LOAD r10, 0x888888
    PIXEL r7-30, r8, r10
    PIXEL r7-29, r8, r10
    PIXEL r7-28, r8, r10
    RET

; Subroutine: draw polling indicator
draw_polling_indicator:
    LOAD r10, 0x00FF00
    PIXEL 10, 245, r10
    PIXEL 11, 245, r10
    RET

; Subroutine: delay
; r15 = delay count
delay:
    CMP r15, 0
    JLE delay_done
    SUB r15, r15, 1
    JMP delay
delay_done:
    RET

; Stack handling (simplified)
PUSH:
    ; GeOS doesn't have PUSH/POP, simulate with fixed stack
    RET

POP:
    RET

HALT
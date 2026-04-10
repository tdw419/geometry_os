; fill.asm
;
; Sweeps every pixel of the VM screen (256x256), setting each to a color
; derived from its x position, then halts. Tests BNE conditional branch.
;
; Layout:
;   r0 = x  (0..255)
;   r1 = y  (0..255)
;   r2 = color (tracks x, cycles 0..255)
;   r3 = 1  (increment)
;   r4 = 255 (loop limit, exclusive at 256 which wraps to 0)
;
; Workflow:
;   cp programs/fill.asm programs/boot.asm
;   F8 → F5 → watch the VM screen fill, program halts when done

    LDI r0, 0       ; x = 0
    LDI r1, 0       ; y = 0
    LDI r2, 32      ; color = 32 (first printable ASCII, maps to palette hue 0)
    LDI r3, 1       ; step = 1
    LDI r4, 0       ; sentinel: 0 used as wrap-around detector

row_loop:
    LDI r0, 0       ; reset x to 0 for each row

col_loop:
    PSET r0, r1, r2     ; screen[x, y] = color
    ADD r0, r3          ; x += 1
    ADD r2, r3          ; color += 1
    ; if x wrapped back to 0, row is done
    BEQ r0, r4, next_row
    JMP col_loop

next_row:
    ADD r1, r3          ; y += 1
    ; if y wrapped back to 0, all rows done
    BEQ r1, r4, done
    JMP row_loop

done:
    HALT

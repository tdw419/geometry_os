; counter.asm
;
; Counts through printable ASCII ('!' to DEL and back) at canvas cell [32].
; That's row 1, col 0 on the 32x32 grid -- watch it cycle while the program runs.
;
; Workflow:
;   cp programs/counter.asm programs/boot.asm
;   (switch to canvas) F8  → assemble + load
;   F5                      → run
;   F5 again                → stop
;   F8 + F5                 → reset and run again

    LDI r0, 33      ; start at '!' (0x21)
    LDI r1, 1       ; step = 1
    LDI r2, 32      ; target address: canvas[32] = row 1, col 0

loop:
    STORE r2, r0    ; write current value into canvas RAM
    ADD r0, r1      ; r0 += 1  (wraps at 256 naturally)
    BRANCH 0, loop  ; BRANCH cond=0 → r0==r0, always taken → infinite loop

; DESCRIPTION: Draws a blue rectangle at (7, 107) with width 19 and height 64.
; PLAN: r0=7(x), r1=107(y), r2=19(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 107
LDI r2, 19
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

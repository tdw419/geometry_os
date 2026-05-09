; DESCRIPTION: Draws a green rectangle at (422, 46) with width 36 and height 51.
; PLAN: r0=422(x), r1=46(y), r2=36(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 46
LDI r2, 36
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

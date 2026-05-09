; DESCRIPTION: Draws a black rectangle at (254, 111) with width 56 and height 89.
; PLAN: r0=254(x), r1=111(y), r2=56(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 111
LDI r2, 56
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

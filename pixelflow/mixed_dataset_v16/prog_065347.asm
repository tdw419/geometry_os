; DESCRIPTION: Renders a white box of size 105x84 starting at (264, 2).
; PLAN: r0=264(x), r1=2(y), r2=105(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 2
LDI r2, 105
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

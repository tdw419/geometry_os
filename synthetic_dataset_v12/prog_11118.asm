; DESCRIPTION: Renders a white box of size 18x105 starting at (448, 136).
; PLAN: r0=448(x), r1=136(y), r2=18(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 136
LDI r2, 18
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

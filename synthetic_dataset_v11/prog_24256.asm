; DESCRIPTION: Renders a white box of size 20x75 starting at (24, 136).
; PLAN: r0=24(x), r1=136(y), r2=20(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 136
LDI r2, 20
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

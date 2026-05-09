; DESCRIPTION: Renders a white box of size 105x24 starting at (144, 1).
; PLAN: r0=144(x), r1=1(y), r2=105(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 1
LDI r2, 105
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

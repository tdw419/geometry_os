; DESCRIPTION: Renders a blue box of size 64x105 starting at (233, 83).
; PLAN: r0=233(x), r1=83(y), r2=64(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 83
LDI r2, 64
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

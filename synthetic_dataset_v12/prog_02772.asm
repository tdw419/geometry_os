; DESCRIPTION: Renders a blue box of size 52x81 starting at (444, 38).
; PLAN: r0=444(x), r1=38(y), r2=52(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 38
LDI r2, 52
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

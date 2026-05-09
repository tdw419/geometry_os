; DESCRIPTION: Renders a green box of size 81x52 starting at (4, 83).
; PLAN: r0=4(x), r1=83(y), r2=81(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 83
LDI r2, 81
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

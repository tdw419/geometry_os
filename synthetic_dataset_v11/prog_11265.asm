; DESCRIPTION: Renders a blue box of size 30x115 starting at (81, 17).
; PLAN: r0=81(x), r1=17(y), r2=30(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 17
LDI r2, 30
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

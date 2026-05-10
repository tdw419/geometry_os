; DESCRIPTION: Renders a blue box of size 17x115 starting at (177, 74).
; PLAN: r0=177(x), r1=74(y), r2=17(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 74
LDI r2, 17
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

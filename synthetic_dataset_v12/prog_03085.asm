; DESCRIPTION: Renders a blue box of size 39x81 starting at (139, 115).
; PLAN: r0=139(x), r1=115(y), r2=39(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 115
LDI r2, 39
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

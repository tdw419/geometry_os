; DESCRIPTION: Renders a black box of size 25x81 starting at (201, 127).
; PLAN: r0=201(x), r1=127(y), r2=25(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 127
LDI r2, 25
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

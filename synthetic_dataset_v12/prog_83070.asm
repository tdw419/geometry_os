; DESCRIPTION: Renders a purple box of size 17x81 starting at (104, 86).
; PLAN: r0=104(x), r1=86(y), r2=17(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 86
LDI r2, 17
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

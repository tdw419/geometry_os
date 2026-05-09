; DESCRIPTION: Renders a purple box of size 17x117 starting at (368, 63).
; PLAN: r0=368(x), r1=63(y), r2=17(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 63
LDI r2, 17
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

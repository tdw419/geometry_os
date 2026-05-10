; DESCRIPTION: Renders a purple box of size 13x107 starting at (131, 129).
; PLAN: r0=131(x), r1=129(y), r2=13(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 129
LDI r2, 13
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 17x31 starting at (91, 202).
; PLAN: r0=91(x), r1=202(y), r2=17(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 202
LDI r2, 17
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

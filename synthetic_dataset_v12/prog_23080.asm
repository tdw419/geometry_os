; DESCRIPTION: Renders a purple box of size 22x11 starting at (452, 165).
; PLAN: r0=452(x), r1=165(y), r2=22(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 165
LDI r2, 22
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

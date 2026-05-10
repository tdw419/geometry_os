; DESCRIPTION: Renders a purple box of size 115x102 starting at (43, 138).
; PLAN: r0=43(x), r1=138(y), r2=115(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 138
LDI r2, 115
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

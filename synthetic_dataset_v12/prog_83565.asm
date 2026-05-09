; DESCRIPTION: Renders a purple box of size 51x58 starting at (309, 183).
; PLAN: r0=309(x), r1=183(y), r2=51(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 183
LDI r2, 51
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

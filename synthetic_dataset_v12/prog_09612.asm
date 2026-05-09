; DESCRIPTION: Renders a purple box of size 106x115 starting at (341, 19).
; PLAN: r0=341(x), r1=19(y), r2=106(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 19
LDI r2, 106
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

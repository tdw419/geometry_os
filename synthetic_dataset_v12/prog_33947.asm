; DESCRIPTION: Renders a purple box of size 19x57 starting at (417, 167).
; PLAN: r0=417(x), r1=167(y), r2=19(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 167
LDI r2, 19
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

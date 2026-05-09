; DESCRIPTION: Renders a purple box of size 64x113 starting at (417, 130).
; PLAN: r0=417(x), r1=130(y), r2=64(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 130
LDI r2, 64
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

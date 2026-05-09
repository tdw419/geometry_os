; DESCRIPTION: Renders a purple box of size 22x112 starting at (297, 7).
; PLAN: r0=297(x), r1=7(y), r2=22(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 7
LDI r2, 22
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

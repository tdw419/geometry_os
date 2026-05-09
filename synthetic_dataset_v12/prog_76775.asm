; DESCRIPTION: Renders a purple box of size 54x85 starting at (297, 158).
; PLAN: r0=297(x), r1=158(y), r2=54(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 158
LDI r2, 54
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

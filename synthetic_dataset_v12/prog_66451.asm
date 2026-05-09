; DESCRIPTION: Renders a purple box of size 48x106 starting at (279, 117).
; PLAN: r0=279(x), r1=117(y), r2=48(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 117
LDI r2, 48
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

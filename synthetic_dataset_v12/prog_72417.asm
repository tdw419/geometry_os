; DESCRIPTION: Renders a purple box of size 106x81 starting at (290, 19).
; PLAN: r0=290(x), r1=19(y), r2=106(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 19
LDI r2, 106
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

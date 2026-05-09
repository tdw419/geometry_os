; DESCRIPTION: Renders a purple box of size 118x57 starting at (161, 124).
; PLAN: r0=161(x), r1=124(y), r2=118(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 124
LDI r2, 118
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

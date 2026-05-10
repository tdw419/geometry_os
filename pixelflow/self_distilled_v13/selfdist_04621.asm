; DESCRIPTION: Creates a purple filled rectangle of size 118x91 starting at (129, 112).
; PLAN: r0=129(x), r1=112(y), r2=118(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 112
LDI r2, 118
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

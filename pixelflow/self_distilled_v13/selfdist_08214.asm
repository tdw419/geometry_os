; DESCRIPTION: Creates a purple filled rectangle of size 109x47 starting at (205, 129).
; PLAN: r0=205(x), r1=129(y), r2=109(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 129
LDI r2, 109
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green filled rectangle of size 78x89 starting at (224, 112).
; PLAN: r0=224(x), r1=112(y), r2=78(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 112
LDI r2, 78
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

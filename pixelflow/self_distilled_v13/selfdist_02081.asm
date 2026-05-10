; DESCRIPTION: Creates a white filled rectangle of size 23x112 starting at (182, 147).
; PLAN: r0=182(x), r1=147(y), r2=23(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 147
LDI r2, 23
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

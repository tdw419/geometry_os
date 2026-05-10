; DESCRIPTION: Creates a green filled rectangle of size 100x60 starting at (36, 124).
; PLAN: r0=36(x), r1=124(y), r2=100(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 124
LDI r2, 100
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

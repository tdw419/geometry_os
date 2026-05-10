; DESCRIPTION: Creates a blue filled rectangle of size 40x107 starting at (357, 168).
; PLAN: r0=357(x), r1=168(y), r2=40(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 168
LDI r2, 40
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

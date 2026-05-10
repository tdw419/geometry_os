; DESCRIPTION: Creates a white filled rectangle of size 34x29 starting at (78, 65).
; PLAN: r0=78(x), r1=65(y), r2=34(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 65
LDI r2, 34
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

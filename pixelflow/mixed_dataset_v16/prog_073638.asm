; DESCRIPTION: Creates a white filled rectangle of size 45x119 starting at (355, 90).
; PLAN: r0=355(x), r1=90(y), r2=45(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 90
LDI r2, 45
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

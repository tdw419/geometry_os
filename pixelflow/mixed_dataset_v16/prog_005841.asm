; DESCRIPTION: Creates a white filled rectangle of size 67x119 starting at (218, 22).
; PLAN: r0=218(x), r1=22(y), r2=67(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 22
LDI r2, 67
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

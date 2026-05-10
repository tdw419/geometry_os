; DESCRIPTION: Creates a white filled rectangle of size 29x19 starting at (205, 34).
; PLAN: r0=205(x), r1=34(y), r2=29(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 34
LDI r2, 29
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white filled rectangle of size 14x66 starting at (353, 169).
; PLAN: r0=353(x), r1=169(y), r2=14(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 169
LDI r2, 14
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

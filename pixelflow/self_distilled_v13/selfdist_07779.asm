; DESCRIPTION: Creates a white filled rectangle of size 40x99 starting at (249, 23).
; PLAN: r0=249(x), r1=23(y), r2=40(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 23
LDI r2, 40
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

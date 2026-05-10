; DESCRIPTION: Creates a white filled rectangle of size 20x61 starting at (22, 175).
; PLAN: r0=22(x), r1=175(y), r2=20(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 175
LDI r2, 20
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white filled rectangle of size 117x13 starting at (233, 114).
; PLAN: r0=233(x), r1=114(y), r2=117(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 114
LDI r2, 117
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

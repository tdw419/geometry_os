; DESCRIPTION: Creates a white filled rectangle of size 90x117 starting at (23, 112).
; PLAN: r0=23(x), r1=112(y), r2=90(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 112
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

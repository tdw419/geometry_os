; DESCRIPTION: Creates a white filled rectangle of size 80x101 starting at (133, 68).
; PLAN: r0=133(x), r1=68(y), r2=80(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 68
LDI r2, 80
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

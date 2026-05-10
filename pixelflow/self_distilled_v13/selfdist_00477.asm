; DESCRIPTION: Creates a white filled rectangle of size 68x103 starting at (181, 18).
; PLAN: r0=181(x), r1=18(y), r2=68(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 18
LDI r2, 68
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow filled rectangle of size 66x92 starting at (325, 152).
; PLAN: r0=325(x), r1=152(y), r2=66(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 152
LDI r2, 66
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow filled rectangle of size 61x104 starting at (390, 40).
; PLAN: r0=390(x), r1=40(y), r2=61(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 40
LDI r2, 61
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

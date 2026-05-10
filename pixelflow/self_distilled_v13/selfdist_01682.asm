; DESCRIPTION: Creates a yellow filled rectangle of size 44x58 starting at (376, 131).
; PLAN: r0=376(x), r1=131(y), r2=44(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 131
LDI r2, 44
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

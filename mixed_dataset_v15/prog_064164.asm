; DESCRIPTION: Creates a orange filled rectangle of size 34x83 starting at (139, 131).
; PLAN: r0=139(x), r1=131(y), r2=34(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 131
LDI r2, 34
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

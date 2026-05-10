; DESCRIPTION: Creates a orange filled rectangle of size 22x53 starting at (285, 10).
; PLAN: r0=285(x), r1=10(y), r2=22(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 10
LDI r2, 22
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

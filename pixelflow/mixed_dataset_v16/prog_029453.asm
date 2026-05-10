; DESCRIPTION: Creates a orange filled rectangle of size 115x44 starting at (335, 102).
; PLAN: r0=335(x), r1=102(y), r2=115(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 102
LDI r2, 115
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

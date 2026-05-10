; DESCRIPTION: Creates a orange filled rectangle of size 22x13 starting at (193, 172).
; PLAN: r0=193(x), r1=172(y), r2=22(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 172
LDI r2, 22
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

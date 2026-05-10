; DESCRIPTION: Creates a orange filled rectangle of size 73x14 starting at (44, 191).
; PLAN: r0=44(x), r1=191(y), r2=73(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 191
LDI r2, 73
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange filled rectangle of size 37x91 starting at (338, 43).
; PLAN: r0=338(x), r1=43(y), r2=37(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 43
LDI r2, 37
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

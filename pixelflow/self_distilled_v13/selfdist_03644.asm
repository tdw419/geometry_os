; DESCRIPTION: Creates a orange filled rectangle of size 33x43 starting at (291, 75).
; PLAN: r0=291(x), r1=75(y), r2=33(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 75
LDI r2, 33
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

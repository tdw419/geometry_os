; DESCRIPTION: Creates a orange filled rectangle of size 22x102 starting at (184, 181).
; PLAN: r0=184(x), r1=181(y), r2=22(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 181
LDI r2, 22
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

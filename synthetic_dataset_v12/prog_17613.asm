; DESCRIPTION: Creates a orange rectangular region at (257, 148) spanning 31 by 76 pixels.
; PLAN: r0=257(x), r1=148(y), r2=31(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 148
LDI r2, 31
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

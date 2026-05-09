; DESCRIPTION: Creates a orange rectangular region at (257, 96) spanning 101 by 65 pixels.
; PLAN: r0=257(x), r1=96(y), r2=101(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 96
LDI r2, 101
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

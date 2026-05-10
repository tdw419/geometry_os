; DESCRIPTION: Creates a orange rectangular region at (266, 6) spanning 64 by 101 pixels.
; PLAN: r0=266(x), r1=6(y), r2=64(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 6
LDI r2, 64
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

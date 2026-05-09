; DESCRIPTION: Creates a orange rectangular region at (227, 6) spanning 43 by 27 pixels.
; PLAN: r0=227(x), r1=6(y), r2=43(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 6
LDI r2, 43
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (145, 151) spanning 31 by 62 pixels.
; PLAN: r0=145(x), r1=151(y), r2=31(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 151
LDI r2, 31
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

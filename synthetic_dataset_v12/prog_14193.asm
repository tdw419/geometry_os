; DESCRIPTION: Creates a orange rectangular region at (181, 144) spanning 54 by 76 pixels.
; PLAN: r0=181(x), r1=144(y), r2=54(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 144
LDI r2, 54
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

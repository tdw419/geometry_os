; DESCRIPTION: Creates a orange rectangular region at (181, 79) spanning 25 by 76 pixels.
; PLAN: r0=181(x), r1=79(y), r2=25(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 79
LDI r2, 25
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

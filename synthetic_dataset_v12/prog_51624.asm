; DESCRIPTION: Creates a orange rectangular region at (336, 87) spanning 10 by 108 pixels.
; PLAN: r0=336(x), r1=87(y), r2=10(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 87
LDI r2, 10
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

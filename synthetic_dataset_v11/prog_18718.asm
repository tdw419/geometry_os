; DESCRIPTION: Creates a orange rectangular region at (17, 79) spanning 108 by 60 pixels.
; PLAN: r0=17(x), r1=79(y), r2=108(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 79
LDI r2, 108
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

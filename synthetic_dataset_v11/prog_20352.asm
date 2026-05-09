; DESCRIPTION: Creates a orange rectangular region at (125, 119) spanning 115 by 108 pixels.
; PLAN: r0=125(x), r1=119(y), r2=115(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 119
LDI r2, 115
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

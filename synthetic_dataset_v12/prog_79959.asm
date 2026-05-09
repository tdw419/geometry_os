; DESCRIPTION: Creates a black rectangular region at (106, 149) spanning 62 by 85 pixels.
; PLAN: r0=106(x), r1=149(y), r2=62(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 149
LDI r2, 62
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

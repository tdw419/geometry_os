; DESCRIPTION: Creates a orange rectangular region at (30, 71) spanning 108 by 106 pixels.
; PLAN: r0=30(x), r1=71(y), r2=108(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 71
LDI r2, 108
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

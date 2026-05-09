; DESCRIPTION: Creates a orange rectangular region at (335, 43) spanning 68 by 105 pixels.
; PLAN: r0=335(x), r1=43(y), r2=68(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 43
LDI r2, 68
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

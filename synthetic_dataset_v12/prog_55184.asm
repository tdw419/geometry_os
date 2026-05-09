; DESCRIPTION: Creates a orange rectangular region at (335, 176) spanning 115 by 55 pixels.
; PLAN: r0=335(x), r1=176(y), r2=115(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 176
LDI r2, 115
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

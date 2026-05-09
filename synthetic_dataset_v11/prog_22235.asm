; DESCRIPTION: Creates a orange rectangular region at (87, 175) spanning 55 by 62 pixels.
; PLAN: r0=87(x), r1=175(y), r2=55(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 175
LDI r2, 55
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

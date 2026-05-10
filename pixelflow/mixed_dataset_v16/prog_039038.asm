; DESCRIPTION: Creates a orange rectangular region at (360, 37) spanning 62 by 91 pixels.
; PLAN: r0=360(x), r1=37(y), r2=62(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 37
LDI r2, 62
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

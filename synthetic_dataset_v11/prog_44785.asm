; DESCRIPTION: Creates a orange rectangular region at (62, 45) spanning 78 by 86 pixels.
; PLAN: r0=62(x), r1=45(y), r2=78(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 45
LDI r2, 78
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

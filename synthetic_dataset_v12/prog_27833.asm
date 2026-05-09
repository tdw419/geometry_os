; DESCRIPTION: Creates a orange rectangular region at (468, 108) spanning 20 by 31 pixels.
; PLAN: r0=468(x), r1=108(y), r2=20(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 108
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

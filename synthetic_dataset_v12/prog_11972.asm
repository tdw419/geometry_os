; DESCRIPTION: Creates a orange rectangular region at (218, 65) spanning 75 by 60 pixels.
; PLAN: r0=218(x), r1=65(y), r2=75(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 65
LDI r2, 75
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

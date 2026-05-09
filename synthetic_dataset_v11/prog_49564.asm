; DESCRIPTION: Creates a orange rectangular region at (84, 61) spanning 110 by 39 pixels.
; PLAN: r0=84(x), r1=61(y), r2=110(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 61
LDI r2, 110
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

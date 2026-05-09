; DESCRIPTION: Creates a orange rectangular region at (9, 119) spanning 117 by 84 pixels.
; PLAN: r0=9(x), r1=119(y), r2=117(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 119
LDI r2, 117
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

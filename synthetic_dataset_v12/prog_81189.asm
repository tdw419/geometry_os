; DESCRIPTION: Creates a orange rectangular region at (200, 78) spanning 117 by 110 pixels.
; PLAN: r0=200(x), r1=78(y), r2=117(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 78
LDI r2, 117
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

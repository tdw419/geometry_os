; DESCRIPTION: Creates a orange rectangular region at (248, 110) spanning 117 by 70 pixels.
; PLAN: r0=248(x), r1=110(y), r2=117(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 110
LDI r2, 117
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

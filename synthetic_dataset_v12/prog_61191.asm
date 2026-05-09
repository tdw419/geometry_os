; DESCRIPTION: Creates a orange rectangular region at (303, 70) spanning 12 by 110 pixels.
; PLAN: r0=303(x), r1=70(y), r2=12(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 70
LDI r2, 12
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

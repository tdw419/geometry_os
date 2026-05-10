; DESCRIPTION: Creates a orange rectangular region at (416, 84) spanning 89 by 38 pixels.
; PLAN: r0=416(x), r1=84(y), r2=89(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 84
LDI r2, 89
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (40, 70) spanning 22 by 46 pixels.
; PLAN: r0=40(x), r1=70(y), r2=22(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 70
LDI r2, 22
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (8, 54) spanning 78 by 70 pixels.
; PLAN: r0=8(x), r1=54(y), r2=78(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 54
LDI r2, 78
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

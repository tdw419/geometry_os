; DESCRIPTION: Creates a orange rectangular region at (389, 101) spanning 70 by 91 pixels.
; PLAN: r0=389(x), r1=101(y), r2=70(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 101
LDI r2, 70
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

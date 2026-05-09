; DESCRIPTION: Creates a orange rectangular region at (84, 69) spanning 95 by 94 pixels.
; PLAN: r0=84(x), r1=69(y), r2=95(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 69
LDI r2, 95
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

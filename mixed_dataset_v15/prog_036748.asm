; DESCRIPTION: Creates a orange rectangular region at (84, 48) spanning 106 by 69 pixels.
; PLAN: r0=84(x), r1=48(y), r2=106(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 48
LDI r2, 106
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

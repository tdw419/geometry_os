; DESCRIPTION: Creates a orange rectangular region at (155, 162) spanning 45 by 59 pixels.
; PLAN: r0=155(x), r1=162(y), r2=45(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 162
LDI r2, 45
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

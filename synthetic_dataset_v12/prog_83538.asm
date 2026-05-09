; DESCRIPTION: Creates a orange rectangular region at (216, 58) spanning 56 by 110 pixels.
; PLAN: r0=216(x), r1=58(y), r2=56(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 58
LDI r2, 56
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

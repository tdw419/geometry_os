; DESCRIPTION: Creates a orange rectangular region at (88, 144) spanning 58 by 98 pixels.
; PLAN: r0=88(x), r1=144(y), r2=58(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 144
LDI r2, 58
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (91, 136) spanning 104 by 62 pixels.
; PLAN: r0=91(x), r1=136(y), r2=104(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 136
LDI r2, 104
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

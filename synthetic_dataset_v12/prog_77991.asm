; DESCRIPTION: Creates a orange rectangular region at (147, 35) spanning 26 by 104 pixels.
; PLAN: r0=147(x), r1=35(y), r2=26(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 35
LDI r2, 26
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

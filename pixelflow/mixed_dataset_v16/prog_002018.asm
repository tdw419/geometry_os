; DESCRIPTION: Creates a orange rectangular region at (347, 18) spanning 109 by 54 pixels.
; PLAN: r0=347(x), r1=18(y), r2=109(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 18
LDI r2, 109
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

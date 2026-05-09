; DESCRIPTION: Creates a orange rectangular region at (248, 33) spanning 53 by 104 pixels.
; PLAN: r0=248(x), r1=33(y), r2=53(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 33
LDI r2, 53
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

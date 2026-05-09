; DESCRIPTION: Creates a orange rectangular region at (366, 34) spanning 11 by 104 pixels.
; PLAN: r0=366(x), r1=34(y), r2=11(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 34
LDI r2, 11
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

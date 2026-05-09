; DESCRIPTION: Creates a orange rectangular region at (60, 68) spanning 104 by 25 pixels.
; PLAN: r0=60(x), r1=68(y), r2=104(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 68
LDI r2, 104
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

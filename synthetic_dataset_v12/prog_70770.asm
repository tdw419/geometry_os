; DESCRIPTION: Creates a orange rectangular region at (125, 35) spanning 95 by 104 pixels.
; PLAN: r0=125(x), r1=35(y), r2=95(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 35
LDI r2, 95
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

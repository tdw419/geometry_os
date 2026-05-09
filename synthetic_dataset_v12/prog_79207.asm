; DESCRIPTION: Creates a orange rectangular region at (61, 15) spanning 104 by 60 pixels.
; PLAN: r0=61(x), r1=15(y), r2=104(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 15
LDI r2, 104
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (120, 104) spanning 100 by 87 pixels.
; PLAN: r0=120(x), r1=104(y), r2=100(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 104
LDI r2, 100
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

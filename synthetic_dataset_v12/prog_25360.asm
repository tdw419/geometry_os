; DESCRIPTION: Creates a orange rectangular region at (176, 79) spanning 10 by 104 pixels.
; PLAN: r0=176(x), r1=79(y), r2=10(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 79
LDI r2, 10
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

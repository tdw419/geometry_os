; DESCRIPTION: Creates a orange rectangular region at (65, 132) spanning 104 by 50 pixels.
; PLAN: r0=65(x), r1=132(y), r2=104(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 132
LDI r2, 104
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (91, 94) spanning 104 by 80 pixels.
; PLAN: r0=91(x), r1=94(y), r2=104(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 94
LDI r2, 104
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (269, 170) spanning 104 by 10 pixels.
; PLAN: r0=269(x), r1=170(y), r2=104(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 170
LDI r2, 104
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

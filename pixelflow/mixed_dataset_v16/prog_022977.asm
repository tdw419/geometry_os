; DESCRIPTION: Creates a orange rectangular region at (269, 11) spanning 98 by 104 pixels.
; PLAN: r0=269(x), r1=11(y), r2=98(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 11
LDI r2, 98
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

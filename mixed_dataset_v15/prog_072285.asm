; DESCRIPTION: Creates a white rectangular region at (68, 97) spanning 104 by 106 pixels.
; PLAN: r0=68(x), r1=97(y), r2=104(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 97
LDI r2, 104
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

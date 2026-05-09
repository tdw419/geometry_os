; DESCRIPTION: Creates a blue rectangular region at (66, 104) spanning 77 by 106 pixels.
; PLAN: r0=66(x), r1=104(y), r2=77(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 104
LDI r2, 77
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

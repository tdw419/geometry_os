; DESCRIPTION: Creates a blue rectangular region at (186, 11) spanning 104 by 17 pixels.
; PLAN: r0=186(x), r1=11(y), r2=104(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 11
LDI r2, 104
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

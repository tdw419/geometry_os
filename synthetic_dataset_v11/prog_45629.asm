; DESCRIPTION: Creates a blue rectangular region at (104, 15) spanning 80 by 95 pixels.
; PLAN: r0=104(x), r1=15(y), r2=80(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 15
LDI r2, 80
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

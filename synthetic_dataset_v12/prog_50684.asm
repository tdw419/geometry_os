; DESCRIPTION: Creates a blue rectangular region at (70, 104) spanning 101 by 115 pixels.
; PLAN: r0=70(x), r1=104(y), r2=101(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 104
LDI r2, 101
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

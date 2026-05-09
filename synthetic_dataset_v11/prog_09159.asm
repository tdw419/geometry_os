; DESCRIPTION: Creates a blue rectangular region at (15, 143) spanning 99 by 104 pixels.
; PLAN: r0=15(x), r1=143(y), r2=99(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 143
LDI r2, 99
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

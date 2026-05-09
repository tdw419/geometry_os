; DESCRIPTION: Creates a black rectangular region at (145, 110) spanning 75 by 94 pixels.
; PLAN: r0=145(x), r1=110(y), r2=75(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 110
LDI r2, 75
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

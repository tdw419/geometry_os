; DESCRIPTION: Creates a black rectangular region at (176, 80) spanning 63 by 110 pixels.
; PLAN: r0=176(x), r1=80(y), r2=63(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 80
LDI r2, 63
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

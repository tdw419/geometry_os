; DESCRIPTION: Creates a black rectangular region at (321, 20) spanning 63 by 83 pixels.
; PLAN: r0=321(x), r1=20(y), r2=63(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 20
LDI r2, 63
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

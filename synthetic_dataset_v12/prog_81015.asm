; DESCRIPTION: Creates a black rectangular region at (110, 120) spanning 46 by 63 pixels.
; PLAN: r0=110(x), r1=120(y), r2=46(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 120
LDI r2, 46
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

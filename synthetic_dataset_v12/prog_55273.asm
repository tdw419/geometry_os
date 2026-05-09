; DESCRIPTION: Creates a black rectangular region at (192, 127) spanning 54 by 18 pixels.
; PLAN: r0=192(x), r1=127(y), r2=54(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 127
LDI r2, 54
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

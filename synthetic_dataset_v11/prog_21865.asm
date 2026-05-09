; DESCRIPTION: Creates a yellow rectangular region at (160, 198) spanning 85 by 29 pixels.
; PLAN: r0=160(x), r1=198(y), r2=85(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 198
LDI r2, 85
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (269, 198) spanning 46 by 13 pixels.
; PLAN: r0=269(x), r1=198(y), r2=46(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 198
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

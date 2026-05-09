; DESCRIPTION: Creates a yellow rectangular region at (94, 188) spanning 79 by 62 pixels.
; PLAN: r0=94(x), r1=188(y), r2=79(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 188
LDI r2, 79
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

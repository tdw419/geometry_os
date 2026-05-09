; DESCRIPTION: Creates a yellow rectangular region at (43, 87) spanning 20 by 65 pixels.
; PLAN: r0=43(x), r1=87(y), r2=20(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 87
LDI r2, 20
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

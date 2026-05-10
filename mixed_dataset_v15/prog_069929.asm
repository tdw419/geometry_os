; DESCRIPTION: Creates a yellow rectangular region at (36, 75) spanning 65 by 69 pixels.
; PLAN: r0=36(x), r1=75(y), r2=65(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 75
LDI r2, 65
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

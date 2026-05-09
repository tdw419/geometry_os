; DESCRIPTION: Creates a yellow rectangular region at (13, 185) spanning 109 by 69 pixels.
; PLAN: r0=13(x), r1=185(y), r2=109(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 185
LDI r2, 109
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

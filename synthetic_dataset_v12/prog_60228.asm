; DESCRIPTION: Creates a yellow rectangular region at (148, 79) spanning 37 by 88 pixels.
; PLAN: r0=148(x), r1=79(y), r2=37(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 79
LDI r2, 37
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

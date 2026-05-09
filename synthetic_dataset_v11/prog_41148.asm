; DESCRIPTION: Creates a yellow rectangular region at (95, 161) spanning 106 by 88 pixels.
; PLAN: r0=95(x), r1=161(y), r2=106(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 161
LDI r2, 106
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

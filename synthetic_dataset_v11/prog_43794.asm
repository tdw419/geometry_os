; DESCRIPTION: Creates a yellow rectangular region at (152, 78) spanning 68 by 55 pixels.
; PLAN: r0=152(x), r1=78(y), r2=68(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 78
LDI r2, 68
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

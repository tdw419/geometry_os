; DESCRIPTION: Creates a yellow rectangular region at (152, 85) spanning 58 by 39 pixels.
; PLAN: r0=152(x), r1=85(y), r2=58(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 85
LDI r2, 58
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

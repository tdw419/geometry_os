; DESCRIPTION: Creates a yellow rectangular region at (186, 68) spanning 65 by 46 pixels.
; PLAN: r0=186(x), r1=68(y), r2=65(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 68
LDI r2, 65
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

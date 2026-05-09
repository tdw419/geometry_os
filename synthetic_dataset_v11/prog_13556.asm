; DESCRIPTION: Creates a yellow rectangular region at (71, 68) spanning 20 by 33 pixels.
; PLAN: r0=71(x), r1=68(y), r2=20(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 68
LDI r2, 20
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

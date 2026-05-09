; DESCRIPTION: Creates a yellow rectangular region at (153, 186) spanning 87 by 69 pixels.
; PLAN: r0=153(x), r1=186(y), r2=87(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 186
LDI r2, 87
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

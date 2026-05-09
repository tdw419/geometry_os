; DESCRIPTION: Creates a yellow rectangular region at (148, 216) spanning 37 by 37 pixels.
; PLAN: r0=148(x), r1=216(y), r2=37(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 216
LDI r2, 37
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (93, 162) spanning 65 by 58 pixels.
; PLAN: r0=93(x), r1=162(y), r2=65(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 162
LDI r2, 65
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

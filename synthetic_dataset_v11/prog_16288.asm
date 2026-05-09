; DESCRIPTION: Creates a green rectangular region at (66, 102) spanning 100 by 68 pixels.
; PLAN: r0=66(x), r1=102(y), r2=100(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 102
LDI r2, 100
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

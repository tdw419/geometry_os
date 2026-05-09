; DESCRIPTION: Creates a green rectangular region at (40, 44) spanning 45 by 118 pixels.
; PLAN: r0=40(x), r1=44(y), r2=45(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 44
LDI r2, 45
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

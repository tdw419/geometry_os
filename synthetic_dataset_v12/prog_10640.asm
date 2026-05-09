; DESCRIPTION: Creates a green rectangular region at (106, 44) spanning 37 by 75 pixels.
; PLAN: r0=106(x), r1=44(y), r2=37(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 44
LDI r2, 37
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

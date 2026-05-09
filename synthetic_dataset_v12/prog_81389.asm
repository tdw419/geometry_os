; DESCRIPTION: Creates a green rectangular region at (133, 57) spanning 65 by 91 pixels.
; PLAN: r0=133(x), r1=57(y), r2=65(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 57
LDI r2, 65
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

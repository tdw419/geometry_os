; DESCRIPTION: Creates a green rectangular region at (57, 145) spanning 40 by 75 pixels.
; PLAN: r0=57(x), r1=145(y), r2=40(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 145
LDI r2, 40
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

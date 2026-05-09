; DESCRIPTION: Creates a green rectangular region at (211, 145) spanning 37 by 47 pixels.
; PLAN: r0=211(x), r1=145(y), r2=37(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 145
LDI r2, 37
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

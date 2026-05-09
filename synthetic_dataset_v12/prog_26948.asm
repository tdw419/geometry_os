; DESCRIPTION: Creates a green rectangular region at (321, 95) spanning 75 by 57 pixels.
; PLAN: r0=321(x), r1=95(y), r2=75(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 95
LDI r2, 75
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

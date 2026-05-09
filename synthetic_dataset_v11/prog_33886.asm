; DESCRIPTION: Creates a green rectangular region at (84, 51) spanning 75 by 46 pixels.
; PLAN: r0=84(x), r1=51(y), r2=75(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 51
LDI r2, 75
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

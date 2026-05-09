; DESCRIPTION: Creates a green rectangular region at (52, 47) spanning 87 by 84 pixels.
; PLAN: r0=52(x), r1=47(y), r2=87(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 47
LDI r2, 87
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

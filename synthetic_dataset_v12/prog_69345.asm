; DESCRIPTION: Creates a green rectangular region at (55, 149) spanning 87 by 81 pixels.
; PLAN: r0=55(x), r1=149(y), r2=87(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 149
LDI r2, 87
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

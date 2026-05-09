; DESCRIPTION: Creates a green rectangular region at (177, 3) spanning 11 by 35 pixels.
; PLAN: r0=177(x), r1=3(y), r2=11(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 3
LDI r2, 11
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (107, 169) spanning 78 by 51 pixels.
; PLAN: r0=107(x), r1=169(y), r2=78(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 169
LDI r2, 78
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (436, 51) spanning 19 by 106 pixels.
; PLAN: r0=436(x), r1=51(y), r2=19(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 51
LDI r2, 19
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

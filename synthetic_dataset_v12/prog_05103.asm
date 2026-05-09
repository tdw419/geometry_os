; DESCRIPTION: Creates a green rectangular region at (49, 92) spanning 51 by 90 pixels.
; PLAN: r0=49(x), r1=92(y), r2=51(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 92
LDI r2, 51
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

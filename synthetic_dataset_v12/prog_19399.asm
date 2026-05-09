; DESCRIPTION: Creates a green rectangular region at (222, 9) spanning 92 by 96 pixels.
; PLAN: r0=222(x), r1=9(y), r2=92(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 9
LDI r2, 92
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

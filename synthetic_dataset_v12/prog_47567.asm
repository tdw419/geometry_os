; DESCRIPTION: Creates a green rectangular region at (376, 138) spanning 92 by 84 pixels.
; PLAN: r0=376(x), r1=138(y), r2=92(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 138
LDI r2, 92
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

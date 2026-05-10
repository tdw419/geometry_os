; DESCRIPTION: Creates a green rectangular region at (29, 92) spanning 80 by 40 pixels.
; PLAN: r0=29(x), r1=92(y), r2=80(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 92
LDI r2, 80
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

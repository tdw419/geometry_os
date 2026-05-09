; DESCRIPTION: Creates a green rectangular region at (92, 232) spanning 57 by 14 pixels.
; PLAN: r0=92(x), r1=232(y), r2=57(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 232
LDI r2, 57
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

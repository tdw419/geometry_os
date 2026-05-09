; DESCRIPTION: Creates a green rectangular region at (306, 152) spanning 92 by 78 pixels.
; PLAN: r0=306(x), r1=152(y), r2=92(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 152
LDI r2, 92
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

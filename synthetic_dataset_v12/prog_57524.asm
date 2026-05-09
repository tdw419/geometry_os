; DESCRIPTION: Creates a green rectangular region at (73, 102) spanning 12 by 20 pixels.
; PLAN: r0=73(x), r1=102(y), r2=12(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 102
LDI r2, 12
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

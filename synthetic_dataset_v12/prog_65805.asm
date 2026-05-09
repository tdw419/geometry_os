; DESCRIPTION: Creates a green rectangular region at (454, 152) spanning 15 by 102 pixels.
; PLAN: r0=454(x), r1=152(y), r2=15(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 152
LDI r2, 15
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

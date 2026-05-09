; DESCRIPTION: Creates a green rectangular region at (97, 80) spanning 92 by 45 pixels.
; PLAN: r0=97(x), r1=80(y), r2=92(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 80
LDI r2, 92
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

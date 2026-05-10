; DESCRIPTION: Creates a green rectangular region at (356, 81) spanning 58 by 106 pixels.
; PLAN: r0=356(x), r1=81(y), r2=58(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 81
LDI r2, 58
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (382, 124) spanning 101 by 49 pixels.
; PLAN: r0=382(x), r1=124(y), r2=101(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 124
LDI r2, 101
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (56, 138) spanning 60 by 55 pixels.
; PLAN: r0=56(x), r1=138(y), r2=60(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 138
LDI r2, 60
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

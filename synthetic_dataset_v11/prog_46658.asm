; DESCRIPTION: Creates a green rectangular region at (109, 140) spanning 33 by 102 pixels.
; PLAN: r0=109(x), r1=140(y), r2=33(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 140
LDI r2, 33
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (140, 140) spanning 114 by 112 pixels.
; PLAN: r0=140(x), r1=140(y), r2=114(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 140
LDI r2, 114
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

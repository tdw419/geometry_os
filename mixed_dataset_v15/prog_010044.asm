; DESCRIPTION: Creates a green rectangular region at (140, 1) spanning 29 by 48 pixels.
; PLAN: r0=140(x), r1=1(y), r2=29(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 1
LDI r2, 29
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

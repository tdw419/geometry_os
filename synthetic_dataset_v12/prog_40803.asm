; DESCRIPTION: Creates a green rectangular region at (240, 34) spanning 58 by 93 pixels.
; PLAN: r0=240(x), r1=34(y), r2=58(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 34
LDI r2, 58
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

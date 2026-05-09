; DESCRIPTION: Creates a green rectangular region at (22, 44) spanning 93 by 54 pixels.
; PLAN: r0=22(x), r1=44(y), r2=93(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 44
LDI r2, 93
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (40, 80) spanning 118 by 27 pixels.
; PLAN: r0=40(x), r1=80(y), r2=118(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 80
LDI r2, 118
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

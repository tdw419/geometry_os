; DESCRIPTION: Creates a green rectangular region at (94, 99) spanning 95 by 114 pixels.
; PLAN: r0=94(x), r1=99(y), r2=95(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 99
LDI r2, 95
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

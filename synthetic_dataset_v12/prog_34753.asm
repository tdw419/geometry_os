; DESCRIPTION: Creates a green rectangular region at (302, 157) spanning 101 by 77 pixels.
; PLAN: r0=302(x), r1=157(y), r2=101(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 157
LDI r2, 101
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

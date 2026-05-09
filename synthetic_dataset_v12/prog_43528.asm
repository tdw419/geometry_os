; DESCRIPTION: Creates a green rectangular region at (174, 153) spanning 62 by 90 pixels.
; PLAN: r0=174(x), r1=153(y), r2=62(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 153
LDI r2, 62
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

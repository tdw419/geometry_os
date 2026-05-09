; DESCRIPTION: Creates a green rectangular region at (477, 153) spanning 26 by 40 pixels.
; PLAN: r0=477(x), r1=153(y), r2=26(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 153
LDI r2, 26
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (55, 4) spanning 15 by 111 pixels.
; PLAN: r0=55(x), r1=4(y), r2=15(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 4
LDI r2, 15
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

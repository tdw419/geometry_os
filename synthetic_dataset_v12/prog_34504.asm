; DESCRIPTION: Creates a green rectangular region at (240, 44) spanning 115 by 111 pixels.
; PLAN: r0=240(x), r1=44(y), r2=115(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 44
LDI r2, 115
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (285, 44) spanning 92 by 111 pixels.
; PLAN: r0=285(x), r1=44(y), r2=92(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 44
LDI r2, 92
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

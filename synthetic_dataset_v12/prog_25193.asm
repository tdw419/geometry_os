; DESCRIPTION: Creates a green rectangular region at (141, 60) spanning 33 by 92 pixels.
; PLAN: r0=141(x), r1=60(y), r2=33(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 60
LDI r2, 33
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

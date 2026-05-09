; DESCRIPTION: Creates a green rectangular region at (100, 148) spanning 60 by 92 pixels.
; PLAN: r0=100(x), r1=148(y), r2=60(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 148
LDI r2, 60
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

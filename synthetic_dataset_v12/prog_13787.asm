; DESCRIPTION: Creates a green rectangular region at (118, 118) spanning 111 by 100 pixels.
; PLAN: r0=118(x), r1=118(y), r2=111(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 118
LDI r2, 111
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

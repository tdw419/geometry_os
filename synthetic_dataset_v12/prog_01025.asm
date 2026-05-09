; DESCRIPTION: Creates a green rectangular region at (300, 92) spanning 95 by 101 pixels.
; PLAN: r0=300(x), r1=92(y), r2=95(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 92
LDI r2, 95
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

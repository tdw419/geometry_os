; DESCRIPTION: Creates a green rectangular region at (0, 107) spanning 100 by 96 pixels.
; PLAN: r0=0(x), r1=107(y), r2=100(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 107
LDI r2, 100
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

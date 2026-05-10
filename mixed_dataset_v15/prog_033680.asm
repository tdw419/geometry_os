; DESCRIPTION: Creates a green rectangular region at (278, 131) spanning 20 by 23 pixels.
; PLAN: r0=278(x), r1=131(y), r2=20(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 131
LDI r2, 20
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

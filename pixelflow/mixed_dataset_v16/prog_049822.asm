; DESCRIPTION: Creates a green rectangular region at (223, 99) spanning 120 by 92 pixels.
; PLAN: r0=223(x), r1=99(y), r2=120(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 99
LDI r2, 120
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

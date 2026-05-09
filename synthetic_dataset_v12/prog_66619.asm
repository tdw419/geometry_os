; DESCRIPTION: Creates a green rectangular region at (350, 131) spanning 29 by 91 pixels.
; PLAN: r0=350(x), r1=131(y), r2=29(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 131
LDI r2, 29
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

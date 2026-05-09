; DESCRIPTION: Creates a blue rectangular region at (22, 163) spanning 12 by 91 pixels.
; PLAN: r0=22(x), r1=163(y), r2=12(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 163
LDI r2, 12
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

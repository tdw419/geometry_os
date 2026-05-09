; DESCRIPTION: Creates a blue rectangular region at (134, 91) spanning 80 by 57 pixels.
; PLAN: r0=134(x), r1=91(y), r2=80(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 91
LDI r2, 80
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

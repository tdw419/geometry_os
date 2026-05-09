; DESCRIPTION: Creates a blue rectangular region at (194, 91) spanning 64 by 21 pixels.
; PLAN: r0=194(x), r1=91(y), r2=64(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 91
LDI r2, 64
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (13, 144) spanning 73 by 64 pixels.
; PLAN: r0=13(x), r1=144(y), r2=73(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 144
LDI r2, 73
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

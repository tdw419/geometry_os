; DESCRIPTION: Creates a blue rectangular region at (156, 144) spanning 32 by 84 pixels.
; PLAN: r0=156(x), r1=144(y), r2=32(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 144
LDI r2, 32
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (109, 128) spanning 24 by 31 pixels.
; PLAN: r0=109(x), r1=128(y), r2=24(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 128
LDI r2, 24
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

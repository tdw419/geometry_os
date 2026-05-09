; DESCRIPTION: Creates a blue rectangular region at (64, 229) spanning 14 by 13 pixels.
; PLAN: r0=64(x), r1=229(y), r2=14(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 229
LDI r2, 14
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

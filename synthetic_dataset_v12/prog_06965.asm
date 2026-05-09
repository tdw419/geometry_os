; DESCRIPTION: Creates a green rectangular region at (319, 32) spanning 52 by 19 pixels.
; PLAN: r0=319(x), r1=32(y), r2=52(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 32
LDI r2, 52
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

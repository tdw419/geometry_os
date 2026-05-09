; DESCRIPTION: Creates a green rectangular region at (440, 86) spanning 57 by 11 pixels.
; PLAN: r0=440(x), r1=86(y), r2=57(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 86
LDI r2, 57
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

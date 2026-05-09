; DESCRIPTION: Creates a green rectangular region at (142, 86) spanning 43 by 37 pixels.
; PLAN: r0=142(x), r1=86(y), r2=43(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 86
LDI r2, 43
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (61, 138) spanning 84 by 94 pixels.
; PLAN: r0=61(x), r1=138(y), r2=84(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 138
LDI r2, 84
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

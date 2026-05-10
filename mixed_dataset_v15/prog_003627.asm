; DESCRIPTION: Creates a green rectangular region at (127, 128) spanning 23 by 66 pixels.
; PLAN: r0=127(x), r1=128(y), r2=23(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 128
LDI r2, 23
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

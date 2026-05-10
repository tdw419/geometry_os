; DESCRIPTION: Creates a green rectangular region at (2, 195) spanning 15 by 23 pixels.
; PLAN: r0=2(x), r1=195(y), r2=15(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 195
LDI r2, 15
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

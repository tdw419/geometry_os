; DESCRIPTION: Creates a green rectangular region at (160, 37) spanning 23 by 59 pixels.
; PLAN: r0=160(x), r1=37(y), r2=23(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 37
LDI r2, 23
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

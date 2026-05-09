; DESCRIPTION: Creates a green rectangular region at (56, 6) spanning 71 by 57 pixels.
; PLAN: r0=56(x), r1=6(y), r2=71(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 6
LDI r2, 71
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

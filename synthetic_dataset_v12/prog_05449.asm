; DESCRIPTION: Creates a green rectangular region at (19, 87) spanning 90 by 28 pixels.
; PLAN: r0=19(x), r1=87(y), r2=90(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 87
LDI r2, 90
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

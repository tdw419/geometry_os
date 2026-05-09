; DESCRIPTION: Creates a green rectangular region at (33, 21) spanning 26 by 34 pixels.
; PLAN: r0=33(x), r1=21(y), r2=26(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 21
LDI r2, 26
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

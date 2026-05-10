; DESCRIPTION: Creates a green rectangular region at (8, 69) spanning 80 by 57 pixels.
; PLAN: r0=8(x), r1=69(y), r2=80(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 69
LDI r2, 80
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

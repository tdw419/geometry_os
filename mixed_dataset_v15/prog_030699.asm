; DESCRIPTION: Creates a green rectangular region at (56, 166) spanning 38 by 70 pixels.
; PLAN: r0=56(x), r1=166(y), r2=38(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 166
LDI r2, 38
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (136, 76) spanning 49 by 120 pixels.
; PLAN: r0=136(x), r1=76(y), r2=49(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 76
LDI r2, 49
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

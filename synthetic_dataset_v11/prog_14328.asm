; DESCRIPTION: Creates a green rectangular region at (169, 126) spanning 30 by 49 pixels.
; PLAN: r0=169(x), r1=126(y), r2=30(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 126
LDI r2, 30
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (395, 12) spanning 43 by 32 pixels.
; PLAN: r0=395(x), r1=12(y), r2=43(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 12
LDI r2, 43
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

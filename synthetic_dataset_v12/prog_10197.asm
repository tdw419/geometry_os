; DESCRIPTION: Creates a green rectangular region at (442, 79) spanning 43 by 14 pixels.
; PLAN: r0=442(x), r1=79(y), r2=43(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 79
LDI r2, 43
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (35, 8) spanning 117 by 43 pixels.
; PLAN: r0=35(x), r1=8(y), r2=117(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 8
LDI r2, 117
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

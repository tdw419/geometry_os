; DESCRIPTION: Creates a green rectangular region at (427, 206) spanning 71 by 19 pixels.
; PLAN: r0=427(x), r1=206(y), r2=71(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 206
LDI r2, 71
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

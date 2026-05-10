; DESCRIPTION: Creates a green rectangular region at (191, 134) spanning 43 by 20 pixels.
; PLAN: r0=191(x), r1=134(y), r2=43(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 134
LDI r2, 43
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

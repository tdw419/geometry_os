; DESCRIPTION: Creates a green rectangular region at (191, 158) spanning 17 by 67 pixels.
; PLAN: r0=191(x), r1=158(y), r2=17(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 158
LDI r2, 17
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

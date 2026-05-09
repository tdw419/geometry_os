; DESCRIPTION: Creates a green rectangular region at (176, 43) spanning 104 by 67 pixels.
; PLAN: r0=176(x), r1=43(y), r2=104(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 104
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (67, 165) spanning 58 by 70 pixels.
; PLAN: r0=67(x), r1=165(y), r2=58(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 165
LDI r2, 58
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

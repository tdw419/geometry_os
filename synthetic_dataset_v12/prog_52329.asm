; DESCRIPTION: Creates a green rectangular region at (104, 139) spanning 113 by 23 pixels.
; PLAN: r0=104(x), r1=139(y), r2=113(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 139
LDI r2, 113
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

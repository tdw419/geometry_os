; DESCRIPTION: Creates a green rectangular region at (104, 148) spanning 112 by 28 pixels.
; PLAN: r0=104(x), r1=148(y), r2=112(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 148
LDI r2, 112
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

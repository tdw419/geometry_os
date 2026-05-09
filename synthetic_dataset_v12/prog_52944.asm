; DESCRIPTION: Creates a blue rectangular region at (374, 26) spanning 104 by 23 pixels.
; PLAN: r0=374(x), r1=26(y), r2=104(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 26
LDI r2, 104
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

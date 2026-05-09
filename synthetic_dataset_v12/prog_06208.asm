; DESCRIPTION: Creates a blue rectangular region at (23, 148) spanning 68 by 104 pixels.
; PLAN: r0=23(x), r1=148(y), r2=68(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 148
LDI r2, 68
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

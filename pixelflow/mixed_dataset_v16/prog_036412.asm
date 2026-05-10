; DESCRIPTION: Creates a blue rectangular region at (8, 28) spanning 104 by 61 pixels.
; PLAN: r0=8(x), r1=28(y), r2=104(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 28
LDI r2, 104
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

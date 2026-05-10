; DESCRIPTION: Creates a blue rectangular region at (32, 114) spanning 85 by 104 pixels.
; PLAN: r0=32(x), r1=114(y), r2=85(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 114
LDI r2, 85
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

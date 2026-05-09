; DESCRIPTION: Creates a purple rectangular region at (4, 165) spanning 104 by 69 pixels.
; PLAN: r0=4(x), r1=165(y), r2=104(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 165
LDI r2, 104
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

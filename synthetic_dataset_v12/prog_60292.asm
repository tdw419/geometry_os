; DESCRIPTION: Creates a purple rectangular region at (76, 33) spanning 104 by 109 pixels.
; PLAN: r0=76(x), r1=33(y), r2=104(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 33
LDI r2, 104
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

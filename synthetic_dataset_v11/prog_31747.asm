; DESCRIPTION: Creates a blue rectangular region at (124, 88) spanning 72 by 116 pixels.
; PLAN: r0=124(x), r1=88(y), r2=72(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 88
LDI r2, 72
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

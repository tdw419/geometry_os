; DESCRIPTION: Creates a blue rectangular region at (333, 122) spanning 116 by 72 pixels.
; PLAN: r0=333(x), r1=122(y), r2=116(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 122
LDI r2, 116
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

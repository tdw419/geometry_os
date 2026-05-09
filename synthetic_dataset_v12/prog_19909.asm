; DESCRIPTION: Creates a blue rectangular region at (11, 80) spanning 115 by 116 pixels.
; PLAN: r0=11(x), r1=80(y), r2=115(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 80
LDI r2, 115
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

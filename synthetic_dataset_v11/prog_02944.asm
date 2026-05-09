; DESCRIPTION: Creates a blue rectangular region at (17, 0) spanning 117 by 116 pixels.
; PLAN: r0=17(x), r1=0(y), r2=117(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 0
LDI r2, 117
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

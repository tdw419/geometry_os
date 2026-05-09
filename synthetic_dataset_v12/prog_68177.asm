; DESCRIPTION: Creates a blue rectangular region at (415, 116) spanning 46 by 88 pixels.
; PLAN: r0=415(x), r1=116(y), r2=46(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 116
LDI r2, 46
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

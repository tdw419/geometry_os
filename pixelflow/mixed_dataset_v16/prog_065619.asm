; DESCRIPTION: Creates a blue rectangular region at (255, 6) spanning 71 by 116 pixels.
; PLAN: r0=255(x), r1=6(y), r2=71(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 6
LDI r2, 71
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (116, 10) spanning 61 by 84 pixels.
; PLAN: r0=116(x), r1=10(y), r2=61(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 10
LDI r2, 61
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (8, 47) spanning 116 by 97 pixels.
; PLAN: r0=8(x), r1=47(y), r2=116(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 47
LDI r2, 116
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

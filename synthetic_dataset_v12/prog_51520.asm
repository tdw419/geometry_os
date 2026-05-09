; DESCRIPTION: Creates a blue rectangular region at (343, 53) spanning 33 by 116 pixels.
; PLAN: r0=343(x), r1=53(y), r2=33(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 53
LDI r2, 33
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

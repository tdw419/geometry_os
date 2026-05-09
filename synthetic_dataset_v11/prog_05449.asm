; DESCRIPTION: Creates a blue rectangular region at (57, 102) spanning 116 by 46 pixels.
; PLAN: r0=57(x), r1=102(y), r2=116(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 102
LDI r2, 116
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

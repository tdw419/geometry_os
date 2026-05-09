; DESCRIPTION: Creates a blue rectangular region at (381, 151) spanning 57 by 34 pixels.
; PLAN: r0=381(x), r1=151(y), r2=57(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 151
LDI r2, 57
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

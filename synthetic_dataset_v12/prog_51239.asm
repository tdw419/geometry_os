; DESCRIPTION: Creates a white rectangular region at (382, 175) spanning 62 by 44 pixels.
; PLAN: r0=382(x), r1=175(y), r2=62(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 175
LDI r2, 62
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

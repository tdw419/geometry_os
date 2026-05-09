; DESCRIPTION: Creates a white rectangular region at (97, 59) spanning 119 by 24 pixels.
; PLAN: r0=97(x), r1=59(y), r2=119(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 59
LDI r2, 119
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

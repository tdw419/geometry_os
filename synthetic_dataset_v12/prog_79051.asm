; DESCRIPTION: Creates a blue rectangular region at (97, 25) spanning 61 by 83 pixels.
; PLAN: r0=97(x), r1=25(y), r2=61(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 25
LDI r2, 61
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

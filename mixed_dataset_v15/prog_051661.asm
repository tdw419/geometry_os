; DESCRIPTION: Creates a blue rectangular region at (444, 142) spanning 32 by 97 pixels.
; PLAN: r0=444(x), r1=142(y), r2=32(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 142
LDI r2, 32
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

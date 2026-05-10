; DESCRIPTION: Creates a blue rectangular region at (16, 105) spanning 114 by 21 pixels.
; PLAN: r0=16(x), r1=105(y), r2=114(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 105
LDI r2, 114
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

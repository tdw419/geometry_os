; DESCRIPTION: Creates a blue rectangular region at (327, 97) spanning 100 by 87 pixels.
; PLAN: r0=327(x), r1=97(y), r2=100(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 97
LDI r2, 100
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

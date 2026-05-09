; DESCRIPTION: Creates a blue rectangular region at (105, 13) spanning 66 by 10 pixels.
; PLAN: r0=105(x), r1=13(y), r2=66(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 13
LDI r2, 66
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

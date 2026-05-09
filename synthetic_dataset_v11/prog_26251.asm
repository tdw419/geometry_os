; DESCRIPTION: Creates a blue rectangular region at (50, 66) spanning 99 by 19 pixels.
; PLAN: r0=50(x), r1=66(y), r2=99(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 66
LDI r2, 99
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

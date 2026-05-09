; DESCRIPTION: Creates a blue rectangular region at (0, 25) spanning 100 by 43 pixels.
; PLAN: r0=0(x), r1=25(y), r2=100(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 25
LDI r2, 100
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

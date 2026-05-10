; DESCRIPTION: Creates a blue rectangular region at (15, 70) spanning 112 by 115 pixels.
; PLAN: r0=15(x), r1=70(y), r2=112(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 70
LDI r2, 112
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

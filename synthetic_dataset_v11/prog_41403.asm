; DESCRIPTION: Creates a blue rectangular region at (138, 56) spanning 115 by 117 pixels.
; PLAN: r0=138(x), r1=56(y), r2=115(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 56
LDI r2, 115
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

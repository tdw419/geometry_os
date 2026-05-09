; DESCRIPTION: Creates a blue rectangular region at (138, 53) spanning 107 by 96 pixels.
; PLAN: r0=138(x), r1=53(y), r2=107(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 53
LDI r2, 107
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (256, 115) spanning 118 by 107 pixels.
; PLAN: r0=256(x), r1=115(y), r2=118(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 115
LDI r2, 118
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

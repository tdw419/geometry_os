; DESCRIPTION: Creates a blue rectangular region at (185, 16) spanning 60 by 107 pixels.
; PLAN: r0=185(x), r1=16(y), r2=60(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 16
LDI r2, 60
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

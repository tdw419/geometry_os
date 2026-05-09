; DESCRIPTION: Creates a blue rectangular region at (185, 154) spanning 47 by 94 pixels.
; PLAN: r0=185(x), r1=154(y), r2=47(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 154
LDI r2, 47
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

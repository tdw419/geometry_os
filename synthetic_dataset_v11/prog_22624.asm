; DESCRIPTION: Creates a blue rectangular region at (29, 4) spanning 86 by 20 pixels.
; PLAN: r0=29(x), r1=4(y), r2=86(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 4
LDI r2, 86
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (416, 94) spanning 48 by 87 pixels.
; PLAN: r0=416(x), r1=94(y), r2=48(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 94
LDI r2, 48
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

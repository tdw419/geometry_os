; DESCRIPTION: Creates a blue rectangular region at (416, 147) spanning 52 by 68 pixels.
; PLAN: r0=416(x), r1=147(y), r2=52(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 147
LDI r2, 52
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

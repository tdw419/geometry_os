; DESCRIPTION: Creates a blue rectangular region at (186, 98) spanning 54 by 22 pixels.
; PLAN: r0=186(x), r1=98(y), r2=54(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 98
LDI r2, 54
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

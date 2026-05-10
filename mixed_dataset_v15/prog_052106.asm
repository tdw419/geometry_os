; DESCRIPTION: Creates a blue rectangular region at (388, 7) spanning 54 by 21 pixels.
; PLAN: r0=388(x), r1=7(y), r2=54(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 7
LDI r2, 54
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

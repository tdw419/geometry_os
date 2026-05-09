; DESCRIPTION: Creates a blue rectangular region at (85, 175) spanning 54 by 57 pixels.
; PLAN: r0=85(x), r1=175(y), r2=54(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 175
LDI r2, 54
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (140, 71) spanning 97 by 70 pixels.
; PLAN: r0=140(x), r1=71(y), r2=97(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 71
LDI r2, 97
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

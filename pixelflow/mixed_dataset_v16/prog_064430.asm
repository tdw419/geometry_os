; DESCRIPTION: Creates a blue rectangular region at (90, 29) spanning 65 by 34 pixels.
; PLAN: r0=90(x), r1=29(y), r2=65(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 29
LDI r2, 65
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

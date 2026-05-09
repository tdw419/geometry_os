; DESCRIPTION: Creates a blue rectangular region at (109, 90) spanning 78 by 95 pixels.
; PLAN: r0=109(x), r1=90(y), r2=78(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 90
LDI r2, 78
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

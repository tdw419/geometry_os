; DESCRIPTION: Creates a purple rectangular region at (65, 21) spanning 20 by 78 pixels.
; PLAN: r0=65(x), r1=21(y), r2=20(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 21
LDI r2, 20
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

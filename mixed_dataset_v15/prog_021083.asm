; DESCRIPTION: Creates a blue rectangular region at (190, 78) spanning 93 by 54 pixels.
; PLAN: r0=190(x), r1=78(y), r2=93(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 78
LDI r2, 93
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

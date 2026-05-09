; DESCRIPTION: Creates a blue rectangular region at (65, 38) spanning 81 by 87 pixels.
; PLAN: r0=65(x), r1=38(y), r2=81(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 38
LDI r2, 81
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (149, 120) spanning 20 by 114 pixels.
; PLAN: r0=149(x), r1=120(y), r2=20(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 120
LDI r2, 20
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

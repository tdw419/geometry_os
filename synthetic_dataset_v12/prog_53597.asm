; DESCRIPTION: Creates a blue rectangular region at (330, 105) spanning 108 by 93 pixels.
; PLAN: r0=330(x), r1=105(y), r2=108(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 105
LDI r2, 108
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

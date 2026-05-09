; DESCRIPTION: Creates a blue rectangular region at (71, 105) spanning 117 by 86 pixels.
; PLAN: r0=71(x), r1=105(y), r2=117(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 105
LDI r2, 117
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

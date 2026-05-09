; DESCRIPTION: Creates a blue rectangular region at (98, 191) spanning 117 by 53 pixels.
; PLAN: r0=98(x), r1=191(y), r2=117(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 191
LDI r2, 117
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

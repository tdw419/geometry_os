; DESCRIPTION: Creates a blue rectangular region at (71, 191) spanning 118 by 45 pixels.
; PLAN: r0=71(x), r1=191(y), r2=118(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 191
LDI r2, 118
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

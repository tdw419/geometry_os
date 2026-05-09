; DESCRIPTION: Creates a blue rectangular region at (140, 191) spanning 116 by 54 pixels.
; PLAN: r0=140(x), r1=191(y), r2=116(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 191
LDI r2, 116
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

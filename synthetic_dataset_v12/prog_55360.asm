; DESCRIPTION: Creates a yellow rectangular region at (145, 191) spanning 53 by 45 pixels.
; PLAN: r0=145(x), r1=191(y), r2=53(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 191
LDI r2, 53
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

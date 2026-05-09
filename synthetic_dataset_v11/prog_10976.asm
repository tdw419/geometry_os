; DESCRIPTION: Creates a green rectangular region at (74, 191) spanning 73 by 22 pixels.
; PLAN: r0=74(x), r1=191(y), r2=73(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 191
LDI r2, 73
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

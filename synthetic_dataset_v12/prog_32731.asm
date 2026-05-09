; DESCRIPTION: Creates a green rectangular region at (253, 191) spanning 77 by 11 pixels.
; PLAN: r0=253(x), r1=191(y), r2=77(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 191
LDI r2, 77
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (166, 191) spanning 11 by 36 pixels.
; PLAN: r0=166(x), r1=191(y), r2=11(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 191
LDI r2, 11
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

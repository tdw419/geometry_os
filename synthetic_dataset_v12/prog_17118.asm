; DESCRIPTION: Creates a yellow rectangular region at (77, 193) spanning 11 by 36 pixels.
; PLAN: r0=77(x), r1=193(y), r2=11(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 193
LDI r2, 11
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

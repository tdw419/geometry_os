; DESCRIPTION: Creates a blue rectangular region at (170, 26) spanning 77 by 76 pixels.
; PLAN: r0=170(x), r1=26(y), r2=77(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 26
LDI r2, 77
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

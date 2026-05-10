; DESCRIPTION: Creates a yellow rectangular region at (112, 89) spanning 60 by 46 pixels.
; PLAN: r0=112(x), r1=89(y), r2=60(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 89
LDI r2, 60
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

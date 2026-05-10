; DESCRIPTION: Renders a yellow rectangular region spanning 57 by 46 at (77, 155).
; PLAN: r0=77(x), r1=155(y), r2=57(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 155
LDI r2, 57
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

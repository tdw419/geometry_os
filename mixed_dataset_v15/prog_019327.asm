; DESCRIPTION: Renders a yellow rectangular region spanning 44 by 107 at (217, 62).
; PLAN: r0=217(x), r1=62(y), r2=44(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 62
LDI r2, 44
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

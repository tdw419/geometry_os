; DESCRIPTION: Renders a yellow rectangular region spanning 79 by 119 at (174, 165).
; PLAN: r0=174(x), r1=165(y), r2=79(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 165
LDI r2, 79
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

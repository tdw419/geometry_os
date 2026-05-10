; DESCRIPTION: Renders a yellow rectangular region spanning 22 by 96 at (217, 148).
; PLAN: r0=217(x), r1=148(y), r2=22(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 148
LDI r2, 22
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

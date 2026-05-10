; DESCRIPTION: Renders a yellow rectangular region spanning 70 by 99 at (79, 148).
; PLAN: r0=79(x), r1=148(y), r2=70(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 148
LDI r2, 70
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

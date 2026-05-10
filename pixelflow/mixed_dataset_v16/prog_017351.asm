; DESCRIPTION: Renders a yellow rectangular region spanning 18 by 29 at (328, 76).
; PLAN: r0=328(x), r1=76(y), r2=18(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 76
LDI r2, 18
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

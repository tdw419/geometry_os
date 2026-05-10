; DESCRIPTION: Renders a yellow rectangular region spanning 12 by 83 at (169, 76).
; PLAN: r0=169(x), r1=76(y), r2=12(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 76
LDI r2, 12
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

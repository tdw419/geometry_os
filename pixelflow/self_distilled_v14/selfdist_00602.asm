; DESCRIPTION: Renders a blue rectangular region spanning 46 by 47 at (318, 1).
; PLAN: r0=318(x), r1=1(y), r2=46(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 1
LDI r2, 46
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

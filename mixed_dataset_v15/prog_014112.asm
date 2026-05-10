; DESCRIPTION: Renders a blue rectangular region spanning 55 by 10 at (376, 33).
; PLAN: r0=376(x), r1=33(y), r2=55(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 33
LDI r2, 55
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

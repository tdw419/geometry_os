; DESCRIPTION: Renders a purple rectangular region spanning 20 by 54 at (72, 98).
; PLAN: r0=72(x), r1=98(y), r2=20(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 98
LDI r2, 20
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue rectangular region spanning 98 by 49 at (344, 62).
; PLAN: r0=344(x), r1=62(y), r2=98(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 62
LDI r2, 98
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

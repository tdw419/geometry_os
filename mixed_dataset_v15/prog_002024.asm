; DESCRIPTION: Renders a blue rectangular region spanning 102 by 21 at (45, 197).
; PLAN: r0=45(x), r1=197(y), r2=102(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 197
LDI r2, 102
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

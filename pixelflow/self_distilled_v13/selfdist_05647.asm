; DESCRIPTION: Renders a blue rectangular region spanning 86 by 117 at (310, 182).
; PLAN: r0=310(x), r1=182(y), r2=86(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 182
LDI r2, 86
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

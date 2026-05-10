; DESCRIPTION: Renders a blue rectangular region spanning 56 by 49 at (91, 174).
; PLAN: r0=91(x), r1=174(y), r2=56(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 174
LDI r2, 56
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

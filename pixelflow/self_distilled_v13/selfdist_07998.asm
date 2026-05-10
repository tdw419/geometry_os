; DESCRIPTION: Renders a blue rectangular region spanning 71 by 51 at (59, 160).
; PLAN: r0=59(x), r1=160(y), r2=71(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 160
LDI r2, 71
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

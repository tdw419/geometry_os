; DESCRIPTION: Renders a blue rectangular region spanning 59 by 114 at (287, 195).
; PLAN: r0=287(x), r1=195(y), r2=59(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 195
LDI r2, 59
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue rectangular region spanning 53 by 67 at (385, 135).
; PLAN: r0=385(x), r1=135(y), r2=53(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 135
LDI r2, 53
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

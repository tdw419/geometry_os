; DESCRIPTION: Renders a blue box of size 61x43 starting at (389, 198).
; PLAN: r0=389(x), r1=198(y), r2=61(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 198
LDI r2, 61
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

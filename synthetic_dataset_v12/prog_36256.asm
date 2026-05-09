; DESCRIPTION: Renders a blue box of size 57x14 starting at (389, 198).
; PLAN: r0=389(x), r1=198(y), r2=57(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 198
LDI r2, 57
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

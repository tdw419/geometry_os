; DESCRIPTION: Renders a blue box of size 39x14 starting at (1, 198).
; PLAN: r0=1(x), r1=198(y), r2=39(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 198
LDI r2, 39
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

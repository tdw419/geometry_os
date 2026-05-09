; DESCRIPTION: Renders a blue box of size 26x29 starting at (387, 170).
; PLAN: r0=387(x), r1=170(y), r2=26(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 170
LDI r2, 26
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

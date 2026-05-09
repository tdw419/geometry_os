; DESCRIPTION: Renders a blue box of size 84x39 starting at (18, 72).
; PLAN: r0=18(x), r1=72(y), r2=84(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 72
LDI r2, 84
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

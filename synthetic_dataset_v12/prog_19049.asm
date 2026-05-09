; DESCRIPTION: Renders a blue box of size 23x28 starting at (296, 15).
; PLAN: r0=296(x), r1=15(y), r2=23(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 15
LDI r2, 23
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

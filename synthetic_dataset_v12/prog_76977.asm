; DESCRIPTION: Renders a blue box of size 36x23 starting at (366, 165).
; PLAN: r0=366(x), r1=165(y), r2=36(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 165
LDI r2, 36
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

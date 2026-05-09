; DESCRIPTION: Renders a blue box of size 46x99 starting at (73, 18).
; PLAN: r0=73(x), r1=18(y), r2=46(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 18
LDI r2, 46
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

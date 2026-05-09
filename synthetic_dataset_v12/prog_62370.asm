; DESCRIPTION: Renders a blue box of size 73x46 starting at (210, 2).
; PLAN: r0=210(x), r1=2(y), r2=73(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 2
LDI r2, 73
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 14x22 starting at (210, 84).
; PLAN: r0=210(x), r1=84(y), r2=14(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 84
LDI r2, 14
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

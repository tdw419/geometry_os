; DESCRIPTION: Renders a blue box of size 68x80 starting at (17, 164).
; PLAN: r0=17(x), r1=164(y), r2=68(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 164
LDI r2, 68
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

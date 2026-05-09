; DESCRIPTION: Renders a blue box of size 19x117 starting at (271, 51).
; PLAN: r0=271(x), r1=51(y), r2=19(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 51
LDI r2, 19
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

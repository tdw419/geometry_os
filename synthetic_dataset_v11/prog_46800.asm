; DESCRIPTION: Renders a blue box of size 22x116 starting at (51, 34).
; PLAN: r0=51(x), r1=34(y), r2=22(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 22
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

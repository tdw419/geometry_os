; DESCRIPTION: Renders a yellow box of size 51x109 starting at (49, 74).
; PLAN: r0=49(x), r1=74(y), r2=51(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 74
LDI r2, 51
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 118x51 starting at (53, 13).
; PLAN: r0=53(x), r1=13(y), r2=118(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 13
LDI r2, 118
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

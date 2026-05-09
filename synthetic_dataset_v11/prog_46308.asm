; DESCRIPTION: Renders a red box of size 51x118 starting at (197, 99).
; PLAN: r0=197(x), r1=99(y), r2=51(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 99
LDI r2, 51
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

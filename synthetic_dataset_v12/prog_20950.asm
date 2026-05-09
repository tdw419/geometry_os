; DESCRIPTION: Renders a red box of size 25x51 starting at (103, 197).
; PLAN: r0=103(x), r1=197(y), r2=25(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 197
LDI r2, 25
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

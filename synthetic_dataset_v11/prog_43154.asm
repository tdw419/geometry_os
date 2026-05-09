; DESCRIPTION: Renders a red box of size 101x115 starting at (51, 120).
; PLAN: r0=51(x), r1=120(y), r2=101(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 120
LDI r2, 101
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

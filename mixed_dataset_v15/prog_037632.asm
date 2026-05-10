; DESCRIPTION: Renders a red box of size 20x51 starting at (102, 6).
; PLAN: r0=102(x), r1=6(y), r2=20(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 6
LDI r2, 20
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red box of size 15x51 starting at (366, 59).
; PLAN: r0=366(x), r1=59(y), r2=15(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 59
LDI r2, 15
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

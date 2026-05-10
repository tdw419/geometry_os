; DESCRIPTION: Renders a red box of size 55x51 starting at (190, 131).
; PLAN: r0=190(x), r1=131(y), r2=55(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 131
LDI r2, 55
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

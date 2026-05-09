; DESCRIPTION: Renders a red box of size 109x51 starting at (25, 28).
; PLAN: r0=25(x), r1=28(y), r2=109(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 28
LDI r2, 109
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

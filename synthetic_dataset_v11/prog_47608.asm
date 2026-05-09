; DESCRIPTION: Renders a red box of size 51x72 starting at (17, 39).
; PLAN: r0=17(x), r1=39(y), r2=51(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 39
LDI r2, 51
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

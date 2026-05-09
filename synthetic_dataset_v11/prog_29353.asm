; DESCRIPTION: Renders a red box of size 51x39 starting at (80, 145).
; PLAN: r0=80(x), r1=145(y), r2=51(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 145
LDI r2, 51
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

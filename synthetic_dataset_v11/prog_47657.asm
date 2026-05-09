; DESCRIPTION: Renders a red box of size 51x45 starting at (44, 87).
; PLAN: r0=44(x), r1=87(y), r2=51(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 87
LDI r2, 51
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

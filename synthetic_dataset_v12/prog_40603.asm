; DESCRIPTION: Renders a black box of size 51x78 starting at (386, 119).
; PLAN: r0=386(x), r1=119(y), r2=51(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 119
LDI r2, 51
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

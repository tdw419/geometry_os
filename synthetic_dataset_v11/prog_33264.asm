; DESCRIPTION: Renders a black box of size 13x39 starting at (151, 51).
; PLAN: r0=151(x), r1=51(y), r2=13(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 51
LDI r2, 13
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

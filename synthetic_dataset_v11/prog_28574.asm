; DESCRIPTION: Renders a red box of size 97x51 starting at (90, 130).
; PLAN: r0=90(x), r1=130(y), r2=97(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 97
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

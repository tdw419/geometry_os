; DESCRIPTION: Renders a black box of size 60x98 starting at (47, 77).
; PLAN: r0=47(x), r1=77(y), r2=60(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 77
LDI r2, 60
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

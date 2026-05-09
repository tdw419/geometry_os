; DESCRIPTION: Renders a black box of size 34x109 starting at (286, 105).
; PLAN: r0=286(x), r1=105(y), r2=34(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 105
LDI r2, 34
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

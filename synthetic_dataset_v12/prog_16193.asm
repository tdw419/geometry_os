; DESCRIPTION: Renders a black box of size 112x15 starting at (139, 125).
; PLAN: r0=139(x), r1=125(y), r2=112(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 125
LDI r2, 112
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

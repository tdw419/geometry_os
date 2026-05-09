; DESCRIPTION: Renders a black box of size 106x19 starting at (334, 157).
; PLAN: r0=334(x), r1=157(y), r2=106(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 157
LDI r2, 106
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

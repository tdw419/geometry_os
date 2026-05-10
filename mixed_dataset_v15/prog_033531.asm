; DESCRIPTION: Renders a black box of size 106x14 starting at (90, 159).
; PLAN: r0=90(x), r1=159(y), r2=106(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 159
LDI r2, 106
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

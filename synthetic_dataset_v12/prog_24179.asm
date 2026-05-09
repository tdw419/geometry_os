; DESCRIPTION: Renders a black box of size 106x17 starting at (162, 165).
; PLAN: r0=162(x), r1=165(y), r2=106(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 165
LDI r2, 106
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

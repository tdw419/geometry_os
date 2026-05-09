; DESCRIPTION: Renders a black box of size 80x53 starting at (138, 172).
; PLAN: r0=138(x), r1=172(y), r2=80(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 172
LDI r2, 80
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

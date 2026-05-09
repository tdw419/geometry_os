; DESCRIPTION: Renders a black box of size 73x81 starting at (223, 23).
; PLAN: r0=223(x), r1=23(y), r2=73(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 23
LDI r2, 73
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

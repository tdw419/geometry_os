; DESCRIPTION: Renders a black box of size 57x81 starting at (111, 45).
; PLAN: r0=111(x), r1=45(y), r2=57(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 45
LDI r2, 57
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

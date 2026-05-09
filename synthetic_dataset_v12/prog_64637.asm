; DESCRIPTION: Renders a black box of size 103x15 starting at (121, 45).
; PLAN: r0=121(x), r1=45(y), r2=103(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 45
LDI r2, 103
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 82x58 starting at (81, 15).
; PLAN: r0=81(x), r1=15(y), r2=82(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 15
LDI r2, 82
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

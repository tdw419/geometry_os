; DESCRIPTION: Renders a black box of size 30x15 starting at (149, 93).
; PLAN: r0=149(x), r1=93(y), r2=30(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 93
LDI r2, 30
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 118x43 starting at (120, 93).
; PLAN: r0=120(x), r1=93(y), r2=118(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 93
LDI r2, 118
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

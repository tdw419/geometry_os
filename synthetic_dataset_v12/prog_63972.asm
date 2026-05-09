; DESCRIPTION: Renders a black box of size 118x87 starting at (238, 115).
; PLAN: r0=238(x), r1=115(y), r2=118(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 115
LDI r2, 118
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

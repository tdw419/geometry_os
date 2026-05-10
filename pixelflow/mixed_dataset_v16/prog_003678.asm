; DESCRIPTION: Renders a black box of size 29x26 starting at (317, 159).
; PLAN: r0=317(x), r1=159(y), r2=29(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 159
LDI r2, 29
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

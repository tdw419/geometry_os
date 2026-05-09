; DESCRIPTION: Renders a black box of size 24x24 starting at (426, 61).
; PLAN: r0=426(x), r1=61(y), r2=24(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 61
LDI r2, 24
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

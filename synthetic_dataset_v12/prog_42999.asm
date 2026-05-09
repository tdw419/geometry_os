; DESCRIPTION: Renders a black box of size 29x78 starting at (366, 57).
; PLAN: r0=366(x), r1=57(y), r2=29(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 57
LDI r2, 29
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

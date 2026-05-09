; DESCRIPTION: Renders a black box of size 49x95 starting at (194, 146).
; PLAN: r0=194(x), r1=146(y), r2=49(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 146
LDI r2, 49
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

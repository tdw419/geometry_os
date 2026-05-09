; DESCRIPTION: Renders a yellow box of size 49x24 starting at (90, 71).
; PLAN: r0=90(x), r1=71(y), r2=49(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 71
LDI r2, 49
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

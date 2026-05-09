; DESCRIPTION: Renders a black box of size 49x61 starting at (111, 161).
; PLAN: r0=111(x), r1=161(y), r2=49(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 161
LDI r2, 49
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

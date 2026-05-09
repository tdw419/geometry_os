; DESCRIPTION: Renders a black box of size 43x36 starting at (153, 60).
; PLAN: r0=153(x), r1=60(y), r2=43(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 60
LDI r2, 43
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

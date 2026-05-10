; DESCRIPTION: Renders a black box of size 102x15 starting at (200, 158).
; PLAN: r0=200(x), r1=158(y), r2=102(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 158
LDI r2, 102
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

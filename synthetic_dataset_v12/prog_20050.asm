; DESCRIPTION: Renders a black box of size 95x17 starting at (60, 30).
; PLAN: r0=60(x), r1=30(y), r2=95(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 30
LDI r2, 95
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

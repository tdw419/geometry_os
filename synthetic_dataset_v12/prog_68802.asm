; DESCRIPTION: Renders a black box of size 61x19 starting at (1, 137).
; PLAN: r0=1(x), r1=137(y), r2=61(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 137
LDI r2, 61
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

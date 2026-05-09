; DESCRIPTION: Renders a black box of size 86x100 starting at (3, 137).
; PLAN: r0=3(x), r1=137(y), r2=86(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 137
LDI r2, 86
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

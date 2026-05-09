; DESCRIPTION: Renders a black box of size 10x30 starting at (170, 19).
; PLAN: r0=170(x), r1=19(y), r2=10(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 19
LDI r2, 10
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

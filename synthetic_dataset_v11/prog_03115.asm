; DESCRIPTION: Renders a black box of size 22x119 starting at (50, 40).
; PLAN: r0=50(x), r1=40(y), r2=22(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 40
LDI r2, 22
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

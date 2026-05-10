; DESCRIPTION: Renders a black box of size 101x37 starting at (215, 25).
; PLAN: r0=215(x), r1=25(y), r2=101(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 25
LDI r2, 101
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

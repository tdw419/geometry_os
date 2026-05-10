; DESCRIPTION: Renders a black box of size 52x40 starting at (215, 78).
; PLAN: r0=215(x), r1=78(y), r2=52(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 78
LDI r2, 52
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

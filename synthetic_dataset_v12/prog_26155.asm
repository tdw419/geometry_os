; DESCRIPTION: Renders a black box of size 41x80 starting at (257, 15).
; PLAN: r0=257(x), r1=15(y), r2=41(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 15
LDI r2, 41
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

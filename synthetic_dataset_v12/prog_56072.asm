; DESCRIPTION: Renders a black box of size 15x41 starting at (214, 2).
; PLAN: r0=214(x), r1=2(y), r2=15(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 2
LDI r2, 15
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 84x41 starting at (14, 204).
; PLAN: r0=14(x), r1=204(y), r2=84(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 204
LDI r2, 84
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

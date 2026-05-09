; DESCRIPTION: Renders a yellow box of size 41x61 starting at (204, 7).
; PLAN: r0=204(x), r1=7(y), r2=41(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 7
LDI r2, 41
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

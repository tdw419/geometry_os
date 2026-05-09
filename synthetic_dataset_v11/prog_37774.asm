; DESCRIPTION: Renders a yellow box of size 40x85 starting at (173, 41).
; PLAN: r0=173(x), r1=41(y), r2=40(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 41
LDI r2, 40
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

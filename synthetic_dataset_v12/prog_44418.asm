; DESCRIPTION: Renders a yellow box of size 112x41 starting at (184, 209).
; PLAN: r0=184(x), r1=209(y), r2=112(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 209
LDI r2, 112
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

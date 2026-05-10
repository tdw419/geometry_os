; DESCRIPTION: Renders a yellow box of size 34x43 starting at (98, 184).
; PLAN: r0=98(x), r1=184(y), r2=34(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 184
LDI r2, 34
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

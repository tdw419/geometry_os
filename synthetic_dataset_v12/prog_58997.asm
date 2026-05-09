; DESCRIPTION: Renders a yellow box of size 52x35 starting at (411, 52).
; PLAN: r0=411(x), r1=52(y), r2=52(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 52
LDI r2, 52
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

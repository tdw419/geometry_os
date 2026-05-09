; DESCRIPTION: Renders a yellow box of size 81x95 starting at (129, 50).
; PLAN: r0=129(x), r1=50(y), r2=81(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 50
LDI r2, 81
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 109x27 starting at (287, 106).
; PLAN: r0=287(x), r1=106(y), r2=109(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 106
LDI r2, 109
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

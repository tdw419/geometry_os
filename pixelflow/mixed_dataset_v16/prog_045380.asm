; DESCRIPTION: Renders a yellow box of size 109x48 starting at (282, 170).
; PLAN: r0=282(x), r1=170(y), r2=109(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 170
LDI r2, 109
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

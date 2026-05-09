; DESCRIPTION: Renders a yellow box of size 42x17 starting at (155, 112).
; PLAN: r0=155(x), r1=112(y), r2=42(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 112
LDI r2, 42
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

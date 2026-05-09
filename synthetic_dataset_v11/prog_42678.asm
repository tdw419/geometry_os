; DESCRIPTION: Renders a yellow box of size 11x81 starting at (71, 11).
; PLAN: r0=71(x), r1=11(y), r2=11(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 11
LDI r2, 11
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

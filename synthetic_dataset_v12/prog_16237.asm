; DESCRIPTION: Renders a yellow box of size 95x81 starting at (264, 129).
; PLAN: r0=264(x), r1=129(y), r2=95(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 129
LDI r2, 95
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

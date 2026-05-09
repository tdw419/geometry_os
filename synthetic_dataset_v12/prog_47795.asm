; DESCRIPTION: Renders a yellow box of size 95x115 starting at (148, 129).
; PLAN: r0=148(x), r1=129(y), r2=95(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 129
LDI r2, 95
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

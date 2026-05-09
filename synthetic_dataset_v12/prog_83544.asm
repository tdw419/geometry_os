; DESCRIPTION: Renders a yellow box of size 14x17 starting at (266, 179).
; PLAN: r0=266(x), r1=179(y), r2=14(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 179
LDI r2, 14
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

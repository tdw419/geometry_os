; DESCRIPTION: Renders a yellow box of size 93x17 starting at (31, 64).
; PLAN: r0=31(x), r1=64(y), r2=93(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 64
LDI r2, 93
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

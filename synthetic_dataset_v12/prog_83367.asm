; DESCRIPTION: Renders a yellow box of size 29x62 starting at (449, 96).
; PLAN: r0=449(x), r1=96(y), r2=29(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 96
LDI r2, 29
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

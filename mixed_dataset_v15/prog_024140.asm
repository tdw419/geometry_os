; DESCRIPTION: Renders a yellow box of size 49x45 starting at (115, 29).
; PLAN: r0=115(x), r1=29(y), r2=49(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 29
LDI r2, 49
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

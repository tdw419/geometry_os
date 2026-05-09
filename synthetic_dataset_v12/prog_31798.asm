; DESCRIPTION: Renders a yellow box of size 49x102 starting at (355, 32).
; PLAN: r0=355(x), r1=32(y), r2=49(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 32
LDI r2, 49
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

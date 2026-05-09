; DESCRIPTION: Renders a yellow box of size 36x24 starting at (361, 148).
; PLAN: r0=361(x), r1=148(y), r2=36(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 148
LDI r2, 36
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

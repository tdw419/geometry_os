; DESCRIPTION: Renders a yellow box of size 22x19 starting at (111, 194).
; PLAN: r0=111(x), r1=194(y), r2=22(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 194
LDI r2, 22
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

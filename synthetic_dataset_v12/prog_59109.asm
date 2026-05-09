; DESCRIPTION: Renders a yellow box of size 73x108 starting at (39, 18).
; PLAN: r0=39(x), r1=18(y), r2=73(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 18
LDI r2, 73
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

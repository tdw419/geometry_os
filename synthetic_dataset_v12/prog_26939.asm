; DESCRIPTION: Renders a yellow box of size 39x29 starting at (34, 45).
; PLAN: r0=34(x), r1=45(y), r2=39(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 45
LDI r2, 39
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

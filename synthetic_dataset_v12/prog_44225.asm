; DESCRIPTION: Renders a yellow box of size 76x39 starting at (56, 140).
; PLAN: r0=56(x), r1=140(y), r2=76(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 140
LDI r2, 76
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

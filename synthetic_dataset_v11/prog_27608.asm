; DESCRIPTION: Renders a yellow box of size 56x34 starting at (157, 140).
; PLAN: r0=157(x), r1=140(y), r2=56(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 140
LDI r2, 56
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

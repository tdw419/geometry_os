; DESCRIPTION: Renders a yellow box of size 89x109 starting at (159, 48).
; PLAN: r0=159(x), r1=48(y), r2=89(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 48
LDI r2, 89
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

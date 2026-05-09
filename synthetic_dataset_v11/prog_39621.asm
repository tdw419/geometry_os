; DESCRIPTION: Renders a yellow box of size 44x18 starting at (93, 48).
; PLAN: r0=93(x), r1=48(y), r2=44(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 48
LDI r2, 44
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

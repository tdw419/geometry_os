; DESCRIPTION: Renders a yellow box of size 12x119 starting at (109, 28).
; PLAN: r0=109(x), r1=28(y), r2=12(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 28
LDI r2, 12
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

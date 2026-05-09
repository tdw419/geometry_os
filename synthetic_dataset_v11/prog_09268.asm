; DESCRIPTION: Renders a yellow box of size 83x12 starting at (53, 163).
; PLAN: r0=53(x), r1=163(y), r2=83(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 163
LDI r2, 83
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

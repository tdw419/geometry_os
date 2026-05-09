; DESCRIPTION: Renders a yellow box of size 101x82 starting at (0, 170).
; PLAN: r0=0(x), r1=170(y), r2=101(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 170
LDI r2, 101
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

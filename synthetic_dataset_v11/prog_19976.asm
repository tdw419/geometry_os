; DESCRIPTION: Renders a yellow box of size 90x36 starting at (139, 48).
; PLAN: r0=139(x), r1=48(y), r2=90(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 48
LDI r2, 90
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

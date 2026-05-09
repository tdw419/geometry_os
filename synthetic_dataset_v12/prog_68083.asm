; DESCRIPTION: Renders a yellow box of size 81x108 starting at (150, 96).
; PLAN: r0=150(x), r1=96(y), r2=81(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 96
LDI r2, 81
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

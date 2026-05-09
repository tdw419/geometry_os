; DESCRIPTION: Renders a yellow box of size 62x35 starting at (127, 199).
; PLAN: r0=127(x), r1=199(y), r2=62(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 199
LDI r2, 62
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow box of size 93x13 starting at (347, 165).
; PLAN: r0=347(x), r1=165(y), r2=93(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 165
LDI r2, 93
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

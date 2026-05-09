; DESCRIPTION: Renders a yellow box of size 61x94 starting at (347, 136).
; PLAN: r0=347(x), r1=136(y), r2=61(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 136
LDI r2, 61
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue circle centered at (368, 168) with radius 34.
; PLAN: r0=368(x), r1=168(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 168
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

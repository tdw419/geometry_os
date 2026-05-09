; DESCRIPTION: Draws a yellow circle centered at (368, 133) with radius 21.
; PLAN: r0=368(x), r1=133(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 133
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

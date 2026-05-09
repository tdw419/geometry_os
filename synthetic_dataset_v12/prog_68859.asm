; DESCRIPTION: Places a magenta circle of radius 65 at center (391, 133).
; PLAN: r0=391(x), r1=133(y), r2=65(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 391
LDI r1, 133
LDI r2, 65
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

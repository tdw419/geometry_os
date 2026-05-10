; DESCRIPTION: Draws a yellow circle centered at (94, 190) with radius 43.
; PLAN: r0=94(x), r1=190(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 190
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

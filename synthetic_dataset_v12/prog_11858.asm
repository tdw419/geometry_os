; DESCRIPTION: Draws a yellow circle centered at (395, 74) with radius 34.
; PLAN: r0=395(x), r1=74(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 74
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

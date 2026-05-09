; DESCRIPTION: Draws a red circle centered at (208, 127) with radius 34.
; PLAN: r0=208(x), r1=127(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 127
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

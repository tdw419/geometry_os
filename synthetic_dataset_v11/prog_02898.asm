; DESCRIPTION: Draws a red circle centered at (225, 177) with radius 19.
; PLAN: r0=225(x), r1=177(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 177
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

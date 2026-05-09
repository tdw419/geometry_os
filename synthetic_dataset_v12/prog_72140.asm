; DESCRIPTION: Draws a red circle centered at (296, 177) with radius 28.
; PLAN: r0=296(x), r1=177(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 177
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

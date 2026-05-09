; DESCRIPTION: Draws a red circle centered at (131, 150) with radius 38.
; PLAN: r0=131(x), r1=150(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 150
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

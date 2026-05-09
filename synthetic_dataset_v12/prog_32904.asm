; DESCRIPTION: Draws a red circle centered at (146, 131) with radius 52.
; PLAN: r0=146(x), r1=131(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 131
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

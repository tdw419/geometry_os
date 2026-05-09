; DESCRIPTION: Draws a red circle centered at (146, 100) with radius 80.
; PLAN: r0=146(x), r1=100(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 100
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

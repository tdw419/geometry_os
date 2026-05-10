; DESCRIPTION: Draws a red circle centered at (300, 146) with radius 56.
; PLAN: r0=300(x), r1=146(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 146
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

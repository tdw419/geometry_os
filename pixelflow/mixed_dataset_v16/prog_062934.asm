; DESCRIPTION: Draws a red circle centered at (220, 50) with radius 33.
; PLAN: r0=220(x), r1=50(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 50
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

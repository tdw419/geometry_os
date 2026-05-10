; DESCRIPTION: Draws a red circle centered at (386, 88) with radius 50.
; PLAN: r0=386(x), r1=88(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 88
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

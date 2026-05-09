; DESCRIPTION: Draws a red circle centered at (108, 103) with radius 50.
; PLAN: r0=108(x), r1=103(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 103
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

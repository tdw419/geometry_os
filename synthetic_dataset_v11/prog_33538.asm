; DESCRIPTION: Draws a red circle centered at (50, 149) with radius 33.
; PLAN: r0=50(x), r1=149(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 149
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

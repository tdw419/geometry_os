; DESCRIPTION: Draws a red circle centered at (225, 180) with radius 70.
; PLAN: r0=225(x), r1=180(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 180
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

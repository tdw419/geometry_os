; DESCRIPTION: Draws a red circle centered at (218, 211) with radius 20.
; PLAN: r0=218(x), r1=211(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 211
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT

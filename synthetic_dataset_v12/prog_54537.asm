; DESCRIPTION: Draws a green circle centered at (234, 186) with radius 55.
; PLAN: r0=234(x), r1=186(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 186
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

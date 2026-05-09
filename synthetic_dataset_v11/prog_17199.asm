; DESCRIPTION: Draws a purple circle centered at (69, 47) with radius 46.
; PLAN: r0=69(x), r1=47(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 47
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

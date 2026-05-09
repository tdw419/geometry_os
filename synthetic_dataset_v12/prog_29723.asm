; DESCRIPTION: Draws a yellow circle centered at (224, 201) with radius 44.
; PLAN: r0=224(x), r1=201(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 201
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

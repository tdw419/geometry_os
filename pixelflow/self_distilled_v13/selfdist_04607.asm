; DESCRIPTION: Renders a cyan circular shape at (369, 43) with radius 69.
; PLAN: r0=369(x), r1=43(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 43
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

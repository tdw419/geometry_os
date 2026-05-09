; DESCRIPTION: Renders a yellow disk with center (404, 152) and radius 45.
; PLAN: r0=404(x), r1=152(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 152
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

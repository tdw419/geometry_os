; DESCRIPTION: Renders a white disk with center (404, 65) and radius 21.
; PLAN: r0=404(x), r1=65(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 65
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

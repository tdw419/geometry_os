; DESCRIPTION: Renders a white disk with center (404, 108) and radius 35.
; PLAN: r0=404(x), r1=108(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 108
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

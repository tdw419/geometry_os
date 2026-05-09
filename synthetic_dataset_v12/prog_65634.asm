; DESCRIPTION: Renders a orange disk with center (404, 108) and radius 65.
; PLAN: r0=404(x), r1=108(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 108
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

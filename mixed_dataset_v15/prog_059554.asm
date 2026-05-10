; DESCRIPTION: Renders a blue disk with center (404, 164) and radius 64.
; PLAN: r0=404(x), r1=164(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 164
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

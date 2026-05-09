; DESCRIPTION: Renders a magenta disk with center (404, 150) and radius 71.
; PLAN: r0=404(x), r1=150(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 150
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT

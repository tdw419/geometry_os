; DESCRIPTION: Places a green circle of radius 19 at center (404, 79).
; PLAN: r0=404(x), r1=79(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 79
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

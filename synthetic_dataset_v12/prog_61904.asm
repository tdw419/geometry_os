; DESCRIPTION: Places a black circle of radius 55 at center (404, 188).
; PLAN: r0=404(x), r1=188(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 188
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

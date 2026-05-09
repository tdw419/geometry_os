; DESCRIPTION: Places a yellow circle of radius 77 at center (404, 120).
; PLAN: r0=404(x), r1=120(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 120
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

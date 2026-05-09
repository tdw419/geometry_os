; DESCRIPTION: Renders a cyan disk with center (404, 79) and radius 75.
; PLAN: r0=404(x), r1=79(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 79
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

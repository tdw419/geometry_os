; DESCRIPTION: Renders a black line between points (65, 245) and (404, 143).
; PLAN: r0=65(x1), r1=245(y1), r2=404(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 245
LDI r2, 404
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

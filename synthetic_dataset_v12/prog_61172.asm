; DESCRIPTION: Renders a black line between points (12, 236) and (434, 199).
; PLAN: r0=12(x1), r1=236(y1), r2=434(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 236
LDI r2, 434
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

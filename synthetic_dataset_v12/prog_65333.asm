; DESCRIPTION: Renders a blue line between points (104, 209) and (341, 82).
; PLAN: r0=104(x1), r1=209(y1), r2=341(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 209
LDI r2, 341
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

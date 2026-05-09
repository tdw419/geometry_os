; DESCRIPTION: Renders a yellow line between points (177, 199) and (198, 239).
; PLAN: r0=177(x1), r1=199(y1), r2=198(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 199
LDI r2, 198
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

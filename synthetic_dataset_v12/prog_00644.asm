; DESCRIPTION: Renders a green line between points (347, 219) and (267, 255).
; PLAN: r0=347(x1), r1=219(y1), r2=267(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 219
LDI r2, 267
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

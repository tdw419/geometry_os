; DESCRIPTION: Renders a green line between points (266, 222) and (455, 30).
; PLAN: r0=266(x1), r1=222(y1), r2=455(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 222
LDI r2, 455
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

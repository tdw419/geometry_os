; DESCRIPTION: Renders a yellow line between points (289, 209) and (5, 221).
; PLAN: r0=289(x1), r1=209(y1), r2=5(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 209
LDI r2, 5
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

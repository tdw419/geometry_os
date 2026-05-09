; DESCRIPTION: Renders a green line between points (490, 218) and (217, 18).
; PLAN: r0=490(x1), r1=218(y1), r2=217(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 218
LDI r2, 217
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a red line between points (329, 17) and (8, 160).
; PLAN: r0=329(x1), r1=17(y1), r2=8(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 17
LDI r2, 8
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

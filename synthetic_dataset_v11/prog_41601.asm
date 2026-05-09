; DESCRIPTION: Renders a red line between points (144, 19) and (223, 86).
; PLAN: r0=144(x1), r1=19(y1), r2=223(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 19
LDI r2, 223
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

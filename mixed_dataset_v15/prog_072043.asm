; DESCRIPTION: Renders a red line between points (278, 234) and (279, 241).
; PLAN: r0=278(x1), r1=234(y1), r2=279(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 234
LDI r2, 279
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

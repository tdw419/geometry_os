; DESCRIPTION: Renders a yellow line between points (206, 160) and (190, 241).
; PLAN: r0=206(x1), r1=160(y1), r2=190(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 160
LDI r2, 190
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

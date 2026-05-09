; DESCRIPTION: Renders a yellow line between points (222, 226) and (166, 241).
; PLAN: r0=222(x1), r1=226(y1), r2=166(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 226
LDI r2, 166
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

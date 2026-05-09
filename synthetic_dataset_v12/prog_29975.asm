; DESCRIPTION: Renders a yellow line between points (40, 241) and (502, 249).
; PLAN: r0=40(x1), r1=241(y1), r2=502(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 241
LDI r2, 502
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a yellow line between points (32, 247) and (330, 17).
; PLAN: r0=32(x1), r1=247(y1), r2=330(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 247
LDI r2, 330
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

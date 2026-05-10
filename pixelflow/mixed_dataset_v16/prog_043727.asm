; DESCRIPTION: Renders a yellow line between points (276, 138) and (181, 37).
; PLAN: r0=276(x1), r1=138(y1), r2=181(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 138
LDI r2, 181
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

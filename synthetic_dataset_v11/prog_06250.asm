; DESCRIPTION: Renders a green line between points (162, 189) and (146, 248).
; PLAN: r0=162(x1), r1=189(y1), r2=146(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 189
LDI r2, 146
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

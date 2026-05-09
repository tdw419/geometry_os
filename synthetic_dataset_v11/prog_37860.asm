; DESCRIPTION: Renders a yellow line between points (91, 146) and (26, 187).
; PLAN: r0=91(x1), r1=146(y1), r2=26(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 146
LDI r2, 26
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

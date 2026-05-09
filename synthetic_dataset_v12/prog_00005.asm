; DESCRIPTION: Renders a yellow line between points (146, 187) and (459, 20).
; PLAN: r0=146(x1), r1=187(y1), r2=459(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 187
LDI r2, 459
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

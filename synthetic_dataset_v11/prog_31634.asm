; DESCRIPTION: Renders a yellow line between points (228, 233) and (91, 35).
; PLAN: r0=228(x1), r1=233(y1), r2=91(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 233
LDI r2, 91
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

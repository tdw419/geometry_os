; DESCRIPTION: Renders a yellow line between points (104, 125) and (23, 221).
; PLAN: r0=104(x1), r1=125(y1), r2=23(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 125
LDI r2, 23
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

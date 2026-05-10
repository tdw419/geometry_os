; DESCRIPTION: Renders a yellow line between points (272, 131) and (117, 0).
; PLAN: r0=272(x1), r1=131(y1), r2=117(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 131
LDI r2, 117
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

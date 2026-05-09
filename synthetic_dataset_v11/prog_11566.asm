; DESCRIPTION: Renders a yellow line between points (107, 131) and (165, 231).
; PLAN: r0=107(x1), r1=131(y1), r2=165(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 131
LDI r2, 165
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

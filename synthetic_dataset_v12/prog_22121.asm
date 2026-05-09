; DESCRIPTION: Renders a magenta line between points (383, 198) and (290, 68).
; PLAN: r0=383(x1), r1=198(y1), r2=290(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 198
LDI r2, 290
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

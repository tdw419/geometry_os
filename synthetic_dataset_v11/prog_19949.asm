; DESCRIPTION: Renders a magenta line between points (16, 170) and (227, 207).
; PLAN: r0=16(x1), r1=170(y1), r2=227(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 170
LDI r2, 227
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

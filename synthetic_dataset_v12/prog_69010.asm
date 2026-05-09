; DESCRIPTION: Renders a magenta line between points (321, 24) and (327, 207).
; PLAN: r0=321(x1), r1=24(y1), r2=327(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 24
LDI r2, 327
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

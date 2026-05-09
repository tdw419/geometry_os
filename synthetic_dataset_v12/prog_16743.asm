; DESCRIPTION: Draws a magenta line from (115, 60) to (478, 204).
; PLAN: r0=115(x1), r1=60(y1), r2=478(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 60
LDI r2, 478
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

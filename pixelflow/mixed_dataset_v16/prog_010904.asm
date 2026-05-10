; DESCRIPTION: Renders a blue line between points (273, 179) and (354, 233).
; PLAN: r0=273(x1), r1=179(y1), r2=354(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 179
LDI r2, 354
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

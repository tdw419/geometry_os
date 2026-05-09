; DESCRIPTION: Renders a magenta line between points (419, 90) and (433, 193).
; PLAN: r0=419(x1), r1=90(y1), r2=433(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 90
LDI r2, 433
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

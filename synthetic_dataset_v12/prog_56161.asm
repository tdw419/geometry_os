; DESCRIPTION: Renders a blue line between points (210, 87) and (190, 214).
; PLAN: r0=210(x1), r1=87(y1), r2=190(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 87
LDI r2, 190
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

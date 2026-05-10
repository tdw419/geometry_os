; DESCRIPTION: Renders a blue line between points (433, 31) and (271, 141).
; PLAN: r0=433(x1), r1=31(y1), r2=271(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 31
LDI r2, 271
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

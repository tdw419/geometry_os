; DESCRIPTION: Renders a blue line between points (87, 177) and (39, 210).
; PLAN: r0=87(x1), r1=177(y1), r2=39(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 177
LDI r2, 39
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

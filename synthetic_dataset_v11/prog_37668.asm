; DESCRIPTION: Renders a blue line between points (240, 81) and (247, 177).
; PLAN: r0=240(x1), r1=81(y1), r2=247(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 81
LDI r2, 247
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (32, 162) and (141, 174).
; PLAN: r0=32(x1), r1=162(y1), r2=141(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 162
LDI r2, 141
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

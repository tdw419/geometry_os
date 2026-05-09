; DESCRIPTION: Renders a blue line between points (10, 202) and (131, 174).
; PLAN: r0=10(x1), r1=202(y1), r2=131(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 202
LDI r2, 131
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

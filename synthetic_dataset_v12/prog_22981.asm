; DESCRIPTION: Renders a blue line between points (411, 44) and (82, 182).
; PLAN: r0=411(x1), r1=44(y1), r2=82(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 44
LDI r2, 82
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

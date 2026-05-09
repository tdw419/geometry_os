; DESCRIPTION: Renders a magenta line between points (225, 120) and (412, 53).
; PLAN: r0=225(x1), r1=120(y1), r2=412(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 120
LDI r2, 412
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

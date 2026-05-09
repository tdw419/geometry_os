; DESCRIPTION: Renders a magenta line between points (393, 53) and (114, 0).
; PLAN: r0=393(x1), r1=53(y1), r2=114(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 53
LDI r2, 114
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

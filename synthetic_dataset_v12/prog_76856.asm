; DESCRIPTION: Renders a magenta line between points (209, 53) and (436, 209).
; PLAN: r0=209(x1), r1=53(y1), r2=436(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 53
LDI r2, 436
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

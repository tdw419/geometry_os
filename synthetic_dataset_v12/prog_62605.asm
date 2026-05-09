; DESCRIPTION: Renders a magenta line between points (375, 133) and (455, 40).
; PLAN: r0=375(x1), r1=133(y1), r2=455(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 133
LDI r2, 455
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

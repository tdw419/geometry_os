; DESCRIPTION: Renders a magenta line between points (366, 206) and (455, 18).
; PLAN: r0=366(x1), r1=206(y1), r2=455(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 206
LDI r2, 455
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

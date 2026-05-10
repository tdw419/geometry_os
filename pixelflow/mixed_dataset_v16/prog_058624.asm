; DESCRIPTION: Renders a magenta line between points (220, 212) and (193, 127).
; PLAN: r0=220(x1), r1=212(y1), r2=193(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 212
LDI r2, 193
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

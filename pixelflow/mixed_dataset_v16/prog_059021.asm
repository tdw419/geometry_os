; DESCRIPTION: Renders a magenta line between points (8, 93) and (127, 193).
; PLAN: r0=8(x1), r1=93(y1), r2=127(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 93
LDI r2, 127
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

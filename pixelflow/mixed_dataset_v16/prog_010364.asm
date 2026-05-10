; DESCRIPTION: Renders a magenta line between points (207, 127) and (446, 251).
; PLAN: r0=207(x1), r1=127(y1), r2=446(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 127
LDI r2, 446
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

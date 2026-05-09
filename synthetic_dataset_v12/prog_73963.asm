; DESCRIPTION: Renders a magenta line between points (206, 197) and (250, 131).
; PLAN: r0=206(x1), r1=197(y1), r2=250(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 197
LDI r2, 250
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

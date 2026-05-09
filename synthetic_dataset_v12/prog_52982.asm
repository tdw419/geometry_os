; DESCRIPTION: Renders a magenta line between points (285, 157) and (93, 231).
; PLAN: r0=285(x1), r1=157(y1), r2=93(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 157
LDI r2, 93
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

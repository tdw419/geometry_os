; DESCRIPTION: Renders a magenta line between points (90, 93) and (123, 38).
; PLAN: r0=90(x1), r1=93(y1), r2=123(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 93
LDI r2, 123
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

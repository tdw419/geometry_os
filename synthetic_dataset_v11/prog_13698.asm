; DESCRIPTION: Renders a magenta line between points (117, 243) and (80, 95).
; PLAN: r0=117(x1), r1=243(y1), r2=80(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 243
LDI r2, 80
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

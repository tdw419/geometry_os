; DESCRIPTION: Renders a magenta line between points (21, 70) and (180, 221).
; PLAN: r0=21(x1), r1=70(y1), r2=180(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 70
LDI r2, 180
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

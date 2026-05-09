; DESCRIPTION: Renders a blue line between points (45, 70) and (180, 150).
; PLAN: r0=45(x1), r1=70(y1), r2=180(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 70
LDI r2, 180
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

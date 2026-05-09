; DESCRIPTION: Renders a magenta line between points (300, 20) and (398, 70).
; PLAN: r0=300(x1), r1=20(y1), r2=398(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 20
LDI r2, 398
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

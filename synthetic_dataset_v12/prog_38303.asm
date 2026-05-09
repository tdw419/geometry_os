; DESCRIPTION: Places a red line segment connecting (65, 120) to (350, 96).
; PLAN: r0=65(x1), r1=120(y1), r2=350(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 120
LDI r2, 350
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

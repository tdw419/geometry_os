; DESCRIPTION: Places a red line segment connecting (17, 243) to (45, 180).
; PLAN: r0=17(x1), r1=243(y1), r2=45(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 243
LDI r2, 45
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

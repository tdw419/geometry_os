; DESCRIPTION: Places a red line segment connecting (180, 47) to (345, 17).
; PLAN: r0=180(x1), r1=47(y1), r2=345(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 47
LDI r2, 345
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (180, 149) to (221, 179).
; PLAN: r0=180(x1), r1=149(y1), r2=221(x2), r3=179(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 149
LDI r2, 221
LDI r3, 179
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

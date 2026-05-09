; DESCRIPTION: Places a red line segment connecting (142, 180) to (213, 121).
; PLAN: r0=142(x1), r1=180(y1), r2=213(x2), r3=121(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 180
LDI r2, 213
LDI r3, 121
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

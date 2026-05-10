; DESCRIPTION: Renders a white line between points (383, 70) and (389, 115).
; PLAN: r0=383(x1), r1=70(y1), r2=389(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 70
LDI r2, 389
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

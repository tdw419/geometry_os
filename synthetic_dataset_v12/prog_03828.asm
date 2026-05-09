; DESCRIPTION: Renders a white line between points (383, 38) and (461, 38).
; PLAN: r0=383(x1), r1=38(y1), r2=461(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 38
LDI r2, 461
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

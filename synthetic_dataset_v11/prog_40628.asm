; DESCRIPTION: Places a white line segment connecting (204, 93) to (177, 180).
; PLAN: r0=204(x1), r1=93(y1), r2=177(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 93
LDI r2, 177
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

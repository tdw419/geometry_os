; DESCRIPTION: Places a white line segment connecting (36, 221) to (423, 186).
; PLAN: r0=36(x1), r1=221(y1), r2=423(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 221
LDI r2, 423
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

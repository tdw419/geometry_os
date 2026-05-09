; DESCRIPTION: Renders a white line between points (433, 131) and (218, 197).
; PLAN: r0=433(x1), r1=131(y1), r2=218(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 131
LDI r2, 218
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

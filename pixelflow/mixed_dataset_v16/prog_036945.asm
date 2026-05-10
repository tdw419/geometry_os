; DESCRIPTION: Renders a green line between points (244, 131) and (198, 199).
; PLAN: r0=244(x1), r1=131(y1), r2=198(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 131
LDI r2, 198
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

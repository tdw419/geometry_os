; DESCRIPTION: Renders a green line between points (120, 254) and (223, 3).
; PLAN: r0=120(x1), r1=254(y1), r2=223(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 254
LDI r2, 223
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

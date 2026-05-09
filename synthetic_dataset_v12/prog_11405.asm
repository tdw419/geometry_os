; DESCRIPTION: Renders a green line between points (379, 120) and (24, 207).
; PLAN: r0=379(x1), r1=120(y1), r2=24(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 120
LDI r2, 24
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

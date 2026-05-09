; DESCRIPTION: Renders a blue line between points (123, 251) and (365, 208).
; PLAN: r0=123(x1), r1=251(y1), r2=365(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 251
LDI r2, 365
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

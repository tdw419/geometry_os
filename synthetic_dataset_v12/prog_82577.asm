; DESCRIPTION: Renders a blue line between points (208, 32) and (361, 38).
; PLAN: r0=208(x1), r1=32(y1), r2=361(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 32
LDI r2, 361
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (471, 206) and (32, 143).
; PLAN: r0=471(x1), r1=206(y1), r2=32(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 206
LDI r2, 32
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

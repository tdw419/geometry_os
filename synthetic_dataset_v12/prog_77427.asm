; DESCRIPTION: Renders a blue line between points (282, 197) and (401, 199).
; PLAN: r0=282(x1), r1=197(y1), r2=401(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 197
LDI r2, 401
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue line segment connecting (211, 253) to (168, 180).
; PLAN: r0=211(x1), r1=253(y1), r2=168(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 253
LDI r2, 168
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

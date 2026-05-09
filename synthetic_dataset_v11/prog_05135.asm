; DESCRIPTION: Places a blue line segment connecting (159, 103) to (120, 50).
; PLAN: r0=159(x1), r1=103(y1), r2=120(x2), r3=50(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 103
LDI r2, 120
LDI r3, 50
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

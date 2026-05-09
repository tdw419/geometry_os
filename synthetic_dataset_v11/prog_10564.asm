; DESCRIPTION: Draws a blue line from (120, 162) to (210, 199).
; PLAN: r0=120(x1), r1=162(y1), r2=210(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 162
LDI r2, 210
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

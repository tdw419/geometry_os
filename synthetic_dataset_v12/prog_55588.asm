; DESCRIPTION: Places a blue line segment connecting (193, 111) to (465, 159).
; PLAN: r0=193(x1), r1=111(y1), r2=465(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 111
LDI r2, 465
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

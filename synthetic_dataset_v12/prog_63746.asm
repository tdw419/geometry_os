; DESCRIPTION: Places a blue line segment connecting (498, 32) to (464, 44).
; PLAN: r0=498(x1), r1=32(y1), r2=464(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 32
LDI r2, 464
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

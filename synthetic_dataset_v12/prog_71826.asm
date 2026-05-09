; DESCRIPTION: Places a magenta line segment connecting (464, 255) to (322, 45).
; PLAN: r0=464(x1), r1=255(y1), r2=322(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 255
LDI r2, 322
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

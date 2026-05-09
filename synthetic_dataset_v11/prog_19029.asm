; DESCRIPTION: Places a magenta line segment connecting (255, 71) to (149, 38).
; PLAN: r0=255(x1), r1=71(y1), r2=149(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 71
LDI r2, 149
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

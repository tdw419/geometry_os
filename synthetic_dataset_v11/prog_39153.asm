; DESCRIPTION: Places a magenta line segment connecting (47, 108) to (179, 253).
; PLAN: r0=47(x1), r1=108(y1), r2=179(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 108
LDI r2, 179
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

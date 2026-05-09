; DESCRIPTION: Places a magenta line segment connecting (24, 236) to (198, 49).
; PLAN: r0=24(x1), r1=236(y1), r2=198(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 236
LDI r2, 198
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

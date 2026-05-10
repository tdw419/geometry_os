; DESCRIPTION: Places a blue line segment connecting (193, 168) to (248, 107).
; PLAN: r0=193(x1), r1=168(y1), r2=248(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 168
LDI r2, 248
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

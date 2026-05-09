; DESCRIPTION: Places a blue line segment connecting (82, 249) to (12, 160).
; PLAN: r0=82(x1), r1=249(y1), r2=12(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 249
LDI r2, 12
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

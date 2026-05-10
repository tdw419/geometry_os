; DESCRIPTION: Places a blue line segment connecting (37, 149) to (365, 103).
; PLAN: r0=37(x1), r1=149(y1), r2=365(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 149
LDI r2, 365
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

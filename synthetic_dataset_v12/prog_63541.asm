; DESCRIPTION: Places a blue line segment connecting (27, 164) to (280, 31).
; PLAN: r0=27(x1), r1=164(y1), r2=280(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 164
LDI r2, 280
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

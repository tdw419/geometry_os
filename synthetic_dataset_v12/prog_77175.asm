; DESCRIPTION: Places a blue line segment connecting (365, 1) to (152, 180).
; PLAN: r0=365(x1), r1=1(y1), r2=152(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 1
LDI r2, 152
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

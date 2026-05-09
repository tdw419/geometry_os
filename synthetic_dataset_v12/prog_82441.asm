; DESCRIPTION: Places a blue line segment connecting (305, 140) to (120, 27).
; PLAN: r0=305(x1), r1=140(y1), r2=120(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 140
LDI r2, 120
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

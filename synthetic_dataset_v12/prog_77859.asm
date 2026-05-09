; DESCRIPTION: Places a green line segment connecting (120, 194) to (440, 175).
; PLAN: r0=120(x1), r1=194(y1), r2=440(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 194
LDI r2, 440
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

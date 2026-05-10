; DESCRIPTION: Places a green line segment connecting (267, 162) to (450, 175).
; PLAN: r0=267(x1), r1=162(y1), r2=450(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 162
LDI r2, 450
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

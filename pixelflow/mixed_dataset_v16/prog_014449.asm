; DESCRIPTION: Places a blue line segment connecting (277, 15) to (42, 13).
; PLAN: r0=277(x1), r1=15(y1), r2=42(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 15
LDI r2, 42
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

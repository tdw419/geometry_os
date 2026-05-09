; DESCRIPTION: Places a green line segment connecting (25, 131) to (79, 37).
; PLAN: r0=25(x1), r1=131(y1), r2=79(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 131
LDI r2, 79
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

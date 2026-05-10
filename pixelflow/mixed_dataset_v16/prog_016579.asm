; DESCRIPTION: Places a magenta line segment connecting (76, 220) to (292, 32).
; PLAN: r0=76(x1), r1=220(y1), r2=292(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 220
LDI r2, 292
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

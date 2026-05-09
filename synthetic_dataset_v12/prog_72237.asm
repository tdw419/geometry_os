; DESCRIPTION: Places a magenta line segment connecting (95, 202) to (220, 59).
; PLAN: r0=95(x1), r1=202(y1), r2=220(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 202
LDI r2, 220
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

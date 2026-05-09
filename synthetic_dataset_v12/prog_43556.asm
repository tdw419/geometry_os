; DESCRIPTION: Places a magenta line segment connecting (377, 0) to (446, 40).
; PLAN: r0=377(x1), r1=0(y1), r2=446(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 0
LDI r2, 446
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

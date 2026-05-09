; DESCRIPTION: Places a magenta line segment connecting (120, 111) to (288, 212).
; PLAN: r0=120(x1), r1=111(y1), r2=288(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 111
LDI r2, 288
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

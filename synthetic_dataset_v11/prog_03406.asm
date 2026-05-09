; DESCRIPTION: Places a magenta line segment connecting (101, 241) to (180, 240).
; PLAN: r0=101(x1), r1=241(y1), r2=180(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 241
LDI r2, 180
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

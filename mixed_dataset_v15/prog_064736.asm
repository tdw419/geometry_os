; DESCRIPTION: Places a magenta line segment connecting (492, 36) to (362, 23).
; PLAN: r0=492(x1), r1=36(y1), r2=362(x2), r3=23(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 36
LDI r2, 362
LDI r3, 23
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

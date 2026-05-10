; DESCRIPTION: Places a magenta line segment connecting (347, 93) to (511, 166).
; PLAN: r0=347(x1), r1=93(y1), r2=511(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 93
LDI r2, 511
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a magenta line segment connecting (472, 236) to (171, 240).
; PLAN: r0=472(x1), r1=236(y1), r2=171(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 236
LDI r2, 171
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

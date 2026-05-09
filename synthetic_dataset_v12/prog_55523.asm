; DESCRIPTION: Places a magenta line segment connecting (511, 21) to (236, 231).
; PLAN: r0=511(x1), r1=21(y1), r2=236(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 21
LDI r2, 236
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

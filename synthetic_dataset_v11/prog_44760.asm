; DESCRIPTION: Places a magenta line segment connecting (119, 19) to (27, 231).
; PLAN: r0=119(x1), r1=19(y1), r2=27(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 19
LDI r2, 27
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

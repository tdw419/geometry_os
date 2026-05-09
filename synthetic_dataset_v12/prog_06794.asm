; DESCRIPTION: Places a magenta line segment connecting (275, 119) to (57, 16).
; PLAN: r0=275(x1), r1=119(y1), r2=57(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 119
LDI r2, 57
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

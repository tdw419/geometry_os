; DESCRIPTION: Places a magenta line segment connecting (57, 94) to (439, 210).
; PLAN: r0=57(x1), r1=94(y1), r2=439(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 94
LDI r2, 439
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

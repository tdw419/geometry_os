; DESCRIPTION: Places a magenta line segment connecting (48, 4) to (57, 164).
; PLAN: r0=48(x1), r1=4(y1), r2=57(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 4
LDI r2, 57
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

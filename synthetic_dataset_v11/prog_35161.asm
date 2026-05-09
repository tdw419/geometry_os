; DESCRIPTION: Places a magenta line segment connecting (215, 6) to (20, 164).
; PLAN: r0=215(x1), r1=6(y1), r2=20(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 6
LDI r2, 20
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

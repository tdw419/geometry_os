; DESCRIPTION: Draws a magenta line from (398, 237) to (366, 177).
; PLAN: r0=398(x1), r1=237(y1), r2=366(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 237
LDI r2, 366
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
